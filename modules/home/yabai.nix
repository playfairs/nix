{ ... }:

{
  services.yabai = {
    enable = true;

    settings = {
      layout = "bsp";

      window_gap = 3;
      left_padding = 3;
      right_padding = 3;
      bottom_padding = 3;
      top_padding = 3;

      active_window_border_color = "0xffff0000";
      normal_window_border_color = "0xffff0000";
      inserted_window_border_color = "0xffff0000";

      border_width = 2;

      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouse_action2 = "resize";

      focus_follows_mouse = "autofocus";
      mouse_drop_action = "swap";
    };
  };
}
