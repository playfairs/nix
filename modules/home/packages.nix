{
  pkgs,
  ...
}:
{
  home.packages =
    with pkgs;
    [
      dbgate
      # prismlauncher
      dev
      fortune
      cowsay
      lolcat
      gum
      latexminted
      pv
      kittysay
      viu
      neofetch
      autotrace
      uv
      java-language-server
      godot
      chromium
      ffmpeg
      spotify
      # ani-cli
      nodejs
      spicetify-cli
      file
      flameshot
      fd
      tree
      unzip
      nil
      nixd
      yt-dlp
      tldr
      yazi
      wget
      uutils-diffutils
      uutils-findutils
      uutils-coreutils-noprefix
      steam
      tetris
      nmap
      # playerctl
    ]
    ++ lib.optionals (!(stdenv.isLinux && stdenv.isAarch64)) [
      insomnia
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
      utm
      pika
      linearmouse
      obs-studio
      discord-rpc
      fzf
      iina
      duti
      aria2
      utm
      haskellPackages.brainfuck
      nasm
      firefox-esr
      windsurf
      bun
      urban-cli
      obsidian
      shottr
      postgresql
      alacritty
      neovim
      lastfm
      zed-editor
      ffmpeg
      pgadmin4

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
    ++ lib.optionals pkgs.stdenv.isLinux [
      wl-clipboard
      wayvnc
      helvum
      easyeffects
      ani-cli
      telegram-desktop
      whatsapp-electron
      brightnessctl
      nugget-doom
      ciscoPacketTracer9
      vlc
      hyprshot
      gimp3
      pavucontrol
      # davinci-resolve
      wayvnc
      libreoffice-qt6-still
      kdePackages.kdeconnect-kde
    ]
    ++ (lib.optionals (pkgs.stdenv.isLinux && pkgs.stdenv.isx86_64) [
      wineWowPackages.waylandFull
      winetricks
    ]);

  programs.ripgrep.enable = true;
}
