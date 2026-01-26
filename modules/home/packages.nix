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
      viu
      neofetch
      java-language-server
      chromium
      ffmpeg
      spotify
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
      fzf
      iina
      ani-cli
      utm
      nasm
      windsurf
      bun
      obsidian
      shottr
      postgresql
      alacritty
      neovim
      lastfm
      zed-editor
      neovim
      ffmpeg
      pgadmin4
      youtube-tui

      (writeShellScriptBin "random-shot" ''
        DIR="/Volumes/Femboy >_</Media/Flameshot Screenshots"

        file=$(${findutils}/bin/find "$DIR" -type f | ${coreutils}/bin/shuf -n 1)

        open "$file"
      '')
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      wl-clipboard
      wayvnc
      helvum
      easyeffects
      telegram-desktop
      whatsapp-electron
      brightnessctl
      nugget-doom
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
