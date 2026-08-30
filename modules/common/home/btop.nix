{
  ...
}:
{
  stylix.targets.btop.enable = false;

  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      color_theme = "TTY";
      vim_keys = true;
      update_ms = 1000;
      truecolor = true;
      temp_scale = "celsius";
    };
  };
}
