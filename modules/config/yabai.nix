{
  linux,
  pkgs,
  lib,
  ...
}:
let
  padding = 6;
in
lib.optionalAttrs (!linux) {
  services.yabai = {
    enable = true;

    extraConfig = "exec ${pkgs.jankyborders}/bin/borders active_color=0xebbcbaff inactive_color=0x00000000 width=10.0";
    config = {
      layout = "bsp";

      left_padding = padding;
      right_padding = padding;
      top_padding = padding;
      bottom_padding = padding;
      window_gap = padding;

      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouse_action2 = "resize";

      focus_follows_mouse = "autoraise";
      mouse_drop_action = "swap";

      # Requires partial SIP disablement
      insert_feedback_color = "0xFFA3BE8C";
    };
  };

  services.skhd = {
    enable = true;

    skhdConfig = ''
      cmd - return : ${pkgs.ghostty-bin}/Applications/Ghostty.app/Contents/MacOS/ghostty
      alt - return : yabai -m window --toggle native-fullscreen
    '';
  };
}