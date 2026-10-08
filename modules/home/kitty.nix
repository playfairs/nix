{
  darwin,
  pkgs,
  lib,
  ...
}:
{
  stylix.targets.kitty.enable = false;

  programs.kitty = {
    enable = true;
    package = pkgs.kitty;

    font = {
      name = "HurmitNF-Regular";
      size = if darwin then 14 else 9;
    };

    settings = {
      background = "#191724";
      foreground = "#e0def4";
      cursor = "#FFFFFF";
      selection_background = "#403d52";
      selection_foreground = "#e0def4";

      color0 = "#26233a";
      color1 = "#eb6f92";
      color2 = "#9ccfd8";
      color3 = "#f6c177";
      color4 = "#31748f";
      color5 = "#c4a7e7";
      color6 = "#ebbcba";
      color7 = "#e0def4";
      color8 = "#6e6a86";
      color9 = "#eb6f92";
      color10 = "#9ccfd8";
      color11 = "#f6c177";
      color12 = "#31748f";
      color13 = "#c4a7e7";
      color14 = "#ebbcba";
      color15 = "#e0def4";

      background_opacity = "0.60";
      macos_titlebar_color = "background";
      hide_window_decorations = "titlebar-only";
      remember_window_size = false;

      cursor_shape = "block";
      cursor_trail = 4;
      cursor_trail_decay = "0.1 0.4";

      bold_font = "HurmitNF-Bold";

      close_on_child_death = true;
    };

    extraConfig = lib.optionalString darwin ''
      initial_window_width 180c
      initial_window_height 50c
    '';
  };
}
