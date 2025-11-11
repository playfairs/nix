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
      viu
      chromium
      ffmpeg
      file
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
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      wl-clipboard
      wayvnc
      helvum
      easyeffects
      vlc
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
