{
  pkgs,
  lib,
  ...
}:
{
  xdg = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "zen.desktop";
        "x-scheme-handler/http" = "zen.desktop";
        "x-scheme-handler/https" = "zen.desktop";
        "x-scheme-handler/about" = "zen.desktop";
        "x-scheme-handler/unknown" = "zen.desktop";
        "application/x-desktop" = "ghostty.desktop";
      };
    };
    desktopEntries = with pkgs; {
      ghostty = {
        name = "Ghostty";
        exec = "${ghostty}/bin/ghostty";
      };
    };
  };
}
