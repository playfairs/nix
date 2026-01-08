{
  lib,
  pkgs,
  linux,
  config,
  flakeConfig,
  ...
}:

let
  hyprland = flakeConfig.desktop.hyprland or { };

  monitors = builtins.map (monitor: {
    name = monitor.name;
    resolution = monitor.resolution;
    refreshRate = monitor.refreshRate;
    position = monitor.position;
    scale = monitor.scale;
  }) hyprland.monitors or [ ];
in
lib.optionalAttrs linux {
  stylix.targets.hyprland.enable = false;

  home.packages = with pkgs; [
    swww
    playerctl
  ];

  wayland.windowManager.hyprland = {
    enable = hyprland.enable or false;

    settings = {
      monitor = builtins.map (
        monitor:
        "${monitor.name},${monitor.resolution}@${builtins.toString monitor.refreshRate},${monitor.position},${builtins.toString monitor.scale}"
      ) monitors;

      # Disable Updated to * toast.
      ecosystem.no_update_news = true;

      # Auto-launching
      exec-once = [
        "swww-daemon &"
        "waybar &"
        "mako &"
      ];

      exec = [
        "swww img ${flakeConfig.user.wallpaper or ../../wallpapers/flake.png}"
      ];

      # General settings
      general = {
        gaps_in = 2.5;
        gaps_out = 5;
        border_size = 3;
        "col.active_border" = "rgb(ebbcba) rgb(ebbcba) 45deg";
        "col.inactive_border" = "rgba(00000000)";
      };

      decoration = {
        rounding = 5;
        active_opacity = 1;
        inactive_opacity = 0.8;
        shadow = {
          enabled = true;
        };
        blur = {
          enabled = true;
          size = 5;
          passes = 2;
        };
      };

      animation = [
        "workspaces, 1, 3, default"
        "windows, 1, 3, default"
        "fade, 1, 5, default"
        "windowsOut, 1, 5, default"
        "border, 1, 5, default"
      ];

      # Inputs (keyboard & mouse)
      # CURRENTLY DISABLED TO BUG-FIND

      # input = {
      #   kb_layout = "us";
      #   follow_mouse = 1;
      #   sensitivity = 0.5;
      #   touchpad = {
      #     natural_scroll = true;
      #   };
      # };

      # gesture = [
      #   "3, horizontal, workspace"
      # ];

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Keybinds
      bind = [
        "SUPER, Return, exec, ${pkgs.ghostty}/bin/ghostty"
        "SUPER, D, exec, ${
          if pkgs.stdenv.isAarch64 then
            "${config.home.homeDirectory}/.nix-profile/bin/vesktop"
          else
            "${config.home.homeDirectory}/.nix-profile/bin/discord"
        }"
        "SUPER, V, exec, clipman pick -t rofi"
        "SUPER, B, exec, ${pkgs.zen}/bin/zen"
        "SUPER, Q, killactive"
        "SUPER ALT SHIFT, Q, exit"
        "SUPER LSHIFT, S, exec, ${pkgs.hyprshot}/bin/hyprshot -m region --clipboard-only"
        "ALT, Space, togglefloating"
        "SUPER, C, togglesplit"
        "ALT, Return, fullscreen"
        "SUPER, 1, workspace, 1"
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        ", Print, exec, hyprshot -m output"
      ];

      bindl = [
        " , XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
        "ALT LSHIFT, F10, exec, ${pkgs.playerctl}/bin/playerctl previous"
        " , XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        "ALT LSHIFT, F11, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        " , XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl playerctl next"
        "ALT LSHIFT, F12, exec, ${pkgs.playerctl}/bin/playerctl playerctl next"
      ];

      bindr = [
        "SUPER, Space, exec, bash -c 'pkill rofi  || ${pkgs.rofi}/bin/rofi -show drun'"
      ];

      # Mouse bindings
      bindm = [
        "SUPER, mouse:272, movewindow"
        "ALT, mouse:272, resizewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      binde = [
        " , XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        " , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      windowrulev2 = [
        "pin, title:Picture-in-Picture"
        "float, title:Picture-in-Picture"
        "size 640 360, title:Picture-in-Picture"
        "pin, title:Picture-in-Picture"
      ];
    };
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
