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
      chromium
      ffmpeg
      spotify
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
      nasm
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
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      wl-clipboard
      wayvnc
      helvum
      easyeffects
      telegram-desktop
      whatsapp-electron
      brightnessctl
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
