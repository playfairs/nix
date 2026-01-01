{
  pkgs,
  ...
}:
{
  stylix.targets.ghostty.enable = false;

  programs.ghostty = {
    package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
    enable = true;

    settings = {
      theme = "Rose Pine";
      background-opacity = 0.95;
      macos-titlebar-style = "hidden";
      quit-after-last-window-closed = true;
      window-save-state = "never";
      font-size = 14;
    };
  };
}