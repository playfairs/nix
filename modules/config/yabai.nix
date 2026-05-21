{
  linux,
  pkgs,
  lib,
  ...
}:
let
  padding = 5;
in
lib.optionalAttrs (!linux) {
  services.yabai = {
    enable = true;
    config = {
      layout = "bsp";
      left_padding = padding;
      right_padding = padding;
      bottom_padding = padding;
      top_padding = padding;
      window_gap = padding;

      window_border = "on";
      active_window_border_color = "0xFF88C0D0";
      normal_window_border_color = "0x002E3440";
      insert_feedback_color = "0xFFA3BE8C";

      border_width = 2;
      mouse_modifier = "alt";
      mouse_action1 = "move";
      move_action2 = "resize";

      focus_follows_mouse = "autoraise";
      mouse_drop_action = "swap";
    };
  };

  services.skhd = {
    enable = true;

    skhdConfig = ''
      cmd - return : ${pkgs.alacritty}/Applications/Alacritty.app/Contents/MacOS/alacritty
    '';
  };
}
