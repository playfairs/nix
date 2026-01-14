{
  darwin,
  pkgs,
  lib,
  ...
}:
{
  stylix.targets.ghostty.enable = false;

  programs.ghostty = {
    package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
    enable = true;

    settings = {
      theme = "Rose Pine Dawn";
      background-opacity = 0.90;
      macos-titlebar-style = "hidden";
      quit-after-last-window-closed = true;
      window-save-state = "never";
      font-size = if darwin then 12 else 9;
      cursor-style = "bar";
    } // lib.optionalAttrs darwin {
      window-height = 40;
      window-width = 180;
    };
  };
}