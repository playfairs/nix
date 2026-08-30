{
  config,
  lib,
  ...
}:
let
  cfg = config.programs.setWallpaper;
in
{
  options.programs.setWallpaper = {
    enable = lib.mkEnableOption "Enable wallpaper setter for macOS";

    wallpaperPath = lib.mkOption {
      type = lib.types.path;
      description = "Path to the wallpaper image";
    };
  };

  config = lib.mkIf cfg.enable {
    home.activation.setWallpaper = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      wallpaper_path="$(realpath ${cfg.wallpaperPath})"
      /usr/bin/osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$wallpaper_path\""
    '';
  };
}
