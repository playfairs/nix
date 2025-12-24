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
      background-opacity = 0.80;
      macos-titlebar-style = "hidden";
      quit-after-last-window-closed = true;
      window-height = 40;
      window-width = 190;
      window-save-state = "never";
      font-size = 11;
      cursor-style = "bar";
    };
  };
}
