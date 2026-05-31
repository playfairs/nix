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
      theme = "Rose Pine Moon";
      background-opacity = 0.95;
      macos-titlebar-style = "hidden";
      quit-after-last-window-closed = true;
      window-save-state = "never";
      font-size = if darwin then 14 else 9;
      font-family = "HurmitNF-Regular";
      font-style = "Bold";
      cursor-style = "bar";
    }
    // lib.optionalAttrs darwin {
      window-height = 50;
      window-width = 180;
    };
  };
}
