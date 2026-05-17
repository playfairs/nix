{
  pkgs,
  lib,
  nix-dev,
  nix-sweep,
  tiffiny,
  asteride,
  sysfetch,
  ...
}:

let
  scriptsDir = ../../scripts;

  scriptBins = lib.mapAttrsToList (
    name: type:
    if type == "regular" then
      pkgs.writeShellScriptBin name (builtins.readFile "${scriptsDir}/${name}")
    else
      null
  ) (builtins.readDir scriptsDir);

  scripts = lib.filter (x: x != null) scriptBins;

in
{
  home.packages =
    scripts
    ++ (with pkgs; [
      dbgate
      # dev
      (nix-dev.packages.${pkgs.stdenv.hostPlatform.system}.dev)
      (nix-sweep.packages.${pkgs.stdenv.hostPlatform.system}.default)
      (tiffiny.packages.${pkgs.stdenv.hostPlatform.system}.tiffiny)
      (sysfetch.packages.${pkgs.stdenv.hostPlatform.system}.sysfetch)
      ddgr
      codeblocks
      mercurial
      emacs
      cloudflared
      listadmin
      mat2
      ansi
      bb
      pnpm
      onefetch
      tailscale
      audacity
      gnupg
      yazi
      rar
      gzip
      # mpv
      portaudio
      inetutils
      gum
      pv
      autotrace
      uv
      java-language-server
      godot
      ffmpeg
      spotify
      zsh-bd
      nodejs
      spicetify-cli
      file
      flameshot
      fd
      tree
      unzip
      nil
      nixd
      # yt-dlp
      # ani-cli
      yazi
      wget
      uutils-diffutils
      uutils-findutils
      uutils-coreutils-noprefix
      steam
    ])

    ++ lib.optionals (!(pkgs.stdenv.isLinux && pkgs.stdenv.isAarch64)) [
      pkgs.insomnia
    ]

    ++ lib.optionals pkgs.stdenv.isDarwin (
      with pkgs;
      [
        utm
        (asteride.packages.${pkgs.stdenv.hostPlatform.system}.asteride)
        pika
        obs-studio
        discord-rpc
        fzf
        msmtp
        iina
        duti
        aria2
        firefox-esr
        windsurf
        bun
        urban-cli
        ffmpeg
        shottr
        alacritty
        neovim
        lastfm
        # zed-editor

        (writeShellScriptBin "random-shot" ''
          DIR="/Volumes/Femboy >_</Media/Flameshot Screenshots"
          file=$(${findutils}/bin/find "$DIR" -type f | ${coreutils}/bin/shuf -n 1)
          open "$file"
        '')

        (writeShellScriptBin "hx-open" ''
          exec ${helix}/bin/hx "$@"
        '')

        (runCommand "Helix.app" { } ''
                  APP="$out/Applications/Helix.app"

                  mkdir -p "$APP/Contents/MacOS"

                  cat > "$APP/Contents/MacOS/helix" <<EOF
          #!/bin/bash
          exec ${helix}/bin/hx "\$@"
          EOF

                  chmod +x "$APP/Contents/MacOS/helix"

                  cat > "$APP/Contents/Info.plist" <<EOF
          <?xml version="1.0" encoding="UTF-8"?>
          <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
          "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
          <plist version="1.0">
          <dict>
            <key>CFBundleExecutable</key>
            <string>helix</string>
            <key>CFBundleIdentifier</key>
            <string>dev.playfairs.helix</string>
            <key>CFBundleName</key>
            <string>Helix</string>
            <key>CFBundlePackageType</key>
            <string>APPL</string>
          </dict>
          </plist>
          EOF
        '')
      ]
    )

    ++ lib.optionals pkgs.stdenv.isLinux (
      with pkgs;
      [
        wl-clipboard
        megasync
        wayvnc
        crosspipe
        easyeffects
        ani-cli
        telegram-desktop
        whatsapp-electron
        brightnessctl
        prismlauncher
        nugget-doom
        vlc
        hyprshot
        gimp3
        pavucontrol
        libreoffice-qt6-still
        kdePackages.kdeconnect-kde
      ]
    )

    ++ lib.optionals (pkgs.stdenv.isLinux && pkgs.stdenv.isx86_64) ([
    ]);

  programs.ripgrep.enable = true;
}
