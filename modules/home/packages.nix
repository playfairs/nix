{
  pkgs,
  lib,
  nix-dev,
  asteride,
  nix-sweep,
  lish,
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
      (nix-sweep.packages.${pkgs.stdenv.hostPlatform.system}.default)
      (nix-dev.packages.${pkgs.stdenv.hostPlatform.system}.dev)
      stockfish
      mercurial
      micro
      emacs
      cloudflared
      # cargo
      listadmin
      pnpm
      onefetch
      tailscale
      mednafen
      gnupg
      yazi
      rar
      gzip
      # mpv
      portaudio
      inetutils
      pv
      autotrace
      uv
      java-language-server
      ffmpeg
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

    ++ lib.optionals (!(pkgs.stdenv.hostPlatform.isLinux && pkgs.stdenv.isAarch64)) [
      pkgs.insomnia
    ]

    ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin (
      with pkgs;
      [
        utm
        (asteride.packages.${pkgs.stdenv.hostPlatform.system}.asteride)
        (lish.packages.${pkgs.stdenv.hostPlatform.system}.lish)
        pika
        obs-studio
        # zed-editor
        gram
        rustup
        discord-rpc
        discord-canary
        bindfs
        fzf
        msmtp
        iina
        duti
        aria2
        # firefox-esr
        bun
        urban-cli
        ffmpeg
        shottr
        alacritty
        # neovim
        lastfm

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

    ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux (
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
        pavucontrol
        libreoffice-qt6-still
        kdePackages.kdeconnect-kde
      ]
    )

    ++ lib.optionals (pkgs.stdenv.hostPlatform.isLinux && pkgs.stdenv.isx86_64) [
    ];

  programs.ripgrep.enable = true;
}
