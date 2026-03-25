{
  lib,
  pkgs,
  linux,
  flakeConfig,
  ...
}:
lib.optionalAttrs linux {
  imports = [
    ../mangowc.nix
  ];

  wayland.windowManager.mangowc = lib.optionalAttrs (flakeConfig.desktop.mangowc.enable or false) {
    enable = true;

    settings = {
      exec-once = [
        "waybar"
        "mako"
        "swww-daemon"
      ];

      # Window effect
      blur = "0";
      blur_layer = "0";
      blur_optimized = "1";
      blur_params_num_passes = 2;
      blur_params_radius = 5;
      blur_params_noise = 0.02;
      blur_params_brightness = 0.9;
      blur_params_contrast = 0.9;
      blur_params_saturation = 1.2;

      shadows = 0;
      layer_shadows = 0;
      shadow_only_floating = 1;
      shadows_size = 10;
      shadows_blur = 15;
      shadows_position_x = 0;
      shadows_position_y = 0;
      shadowscolor = "0x000000ff";

      border_radius = "15";
      no_radius_when_single = "0";
      focused_opacity = "1.0";
      unfocused_opacity = "0.9";

      # Animation Configuration(support type:zoom,slide)
      # tag_animation_direction: 0-horizontal,1-vertical
      animations = "1";
      layer_animations = "1";
      animation_type_open = "slide";
      animation_type_close = "slide";
      animation_fade_in = "1";
      animation_fade_out = "1";
      tag_animation_direction = "1";
      zoom_initial_ratio = "0.3";
      zoom_end_ratio = "0.8";
      fadein_begin_opacity = "0.5";
      fadeout_begin_opacity = "0.8";
      animation_duration_move = "500";
      animation_duration_open = "400";

      "client.hppduration_tag" = "350";
      animation_duration_close = "800";
      animation_duration_focus = "0";
      animation_curve_open = "0.46,1.0,0.29,1";
      animation_curve_move = "0.46,1.0,0.29,1";
      animation_curve_tag = "0.46,1.0,0.29,1";
      animation_curve_close = "0.08,0.92,0,1";
      animation_curve_focus = "0.46,1.0,0.29,1";

      # Scroller Layout Setting
      scroller_structs = "20";
      scroller_default_proportion = "0.8";
      scroller_focus_center = "0";
      scroller_prefer_center = "0";
      edge_scroller_pointer_focus = "1";
      scroller_default_proportion_single = "1.0";
      scroller_proportion_preset = "0.5,0.8,1.0";

      # Master-Stack Layout Setting
      new_is_master = "1";
      default_mfact = "0.55";
      default_nmaster = "1";
      smartgaps = "0";

      # Overview Setting
      hotarea_size = "10";
      enable_hotarea = "0";
      ov_tab_mode = "0";
      overviewgappi = "5";
      overviewgappo = "30";

      # Misc
      no_border_when_single = "0";
      axis_bind_apply_timeout = "100";
      focus_on_activate = "1";
      inhibit_regardless_of_visibility = "0";
      sloppyfocus = "1";
      warpcursor = "1";
      focus_cross_monitor = "0";
      focus_cross_tag = "0";
      enable_floating_snap = "0";
      snap_distance = "30";
      cursor_size = "24";
      drag_tile_to_tile = "1";

      # keyboard
      repeat_rate = "85";
      repeat_delay = "400";
      numlockon = "0";
      xkb_rules_layout = "us,us";
      xkb_rules_variant = ",workman";
      xkb_rules_options = "grp:alt_shift_toggle,eurosign:e,caps:escape";

      # Trackpad
      # need relogin to make it apply
      disable_trackpad = "0";
      tap_to_click = "1";
      tap_and_drag = "1";
      drag_lock = "1";
      trackpad_natural_scrolling = "1";
      left_handed = "0";
      middle_button_emulation = "0";
      swipe_min_threshold = "1";

      # mouse
      # need relogin to make it apply
      disable_while_typing = 0;
      mouse_natural_scrolling = "0";

      # Appearance
      gappih = "10";
      gappiv = "10";
      gappoh = "10";
      gappov = "10";
      scratchpad_width_ratio = "0.8";
      scratchpad_height_ratio = "0.9";
      borderpx = "5";
      rootcolor = "0x201b14ff";
      bordercolor = "0x00000000";
      focuscolor = "0xebbcbaff";
      maximizescreencolor = "0xf6c177ff";
      urgentcolor = "0xeb6f92ff";
      scratchpadcolor = "0x31748fff";
      globalcolor = "0xc4a7e7ff";
      overlaycolor = "0x9ccfd8ff";

      # layout support:
      # tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
      tagrule = [
        "id:1,layout_name:tile"
        "id:2,layout_name:tile"
        "id:3,layout_name:tile"
        "id:4,layout_name:tile"
        "id:5,layout_name:tile"
      ];

      # Key Bindings
      # key name refer to `xev` or `wev` command output,
      # mod keys name: super,ctrl,alt,shift,none
      bind = [
        # reload config
        "Super,R,reload_config"
        "Super,space,spawn,${pkgs.tofi}/bin/tofi-drun --drun-launch=true"
        "Super+SHIFT,S,spawn,${pkgs.hyprshot}/bin/hyprshot -m region --clipboard-only"
        "Super,Return,spawn,foot"

        # menu and terminal
        "Super,B,spawn,firefox"
        "Super,F,spawn,${pkgs.nautilus}/bin/nautilus"
        "Super,D,spawn,discord"

        # exit
        "Super+Shift,Q,quit"
        "Super,q,killclient,"

        # swap window
        "Super+SHIFT,Up,exchange_client,up"
        "Super+SHIFT,Down,exchange_client,down"
        "Super+SHIFT,Left,exchange_client,left"
        "Super+SHIFT,Right,exchange_client,right"

        # switch window status
        "Super,g,toggleglobal,"
        "ALT,Tab,toggleoverview,"
        "ALT,space,togglefloating,"
        "ALT,f,togglemaximizescreen,"
        "ALT,Return,togglefullscreen,"
        "Super+SHIFT,f,togglefakefullscreen,"
        "Super,i,minimized,"
        "Super,o,toggleoverlay,"
        "Super+SHIFT,I,restore_minimized"
        "ALT,z,toggle_scratchpad"

        # tag switch
        "CTRL+Super,Left,viewtoleft,0"
        "CTRL+Super,Right,viewtoright,0"

        "Super,1,view,1,0"
        "Super,2,view,2,0"
        "Super,3,view,3,0"
        "Super,4,view,4,0"
        "Super,5,view,5,0"

        # tag: move client to the tag and focus it
        # tagsilent: move client to the tag and not focus it
        "Super+Shift,1,tag,1,0"
        "Super+Shift,2,tag,2,0"
        "Super+Shift,3,tag,3,0"
        "Super+Shift,4,tag,4,0"
        "Super+Shift,5,tag,5,0"

        # monitor switch
        "alt+shift,Left,focusmon,left"
        "alt+shift,Right,focusmon,right"
        "Super+Alt,Left,tagmon,left"
        "Super+Alt,Right,tagmon,right"

        # gaps
        "ALT+SHIFT,X,incgaps,1"
        "ALT+SHIFT,Z,incgaps,-1"
        "ALT+SHIFT,R,togglegaps"

        # movewin
        "CTRL+SHIFT,Up,movewin,+0,-50"
        "CTRL+SHIFT,Down,movewin,+0,+50"
        "CTRL+SHIFT,Left,movewin,-50,+0"
        "CTRL+SHIFT,Right,movewin,+50,+0"

        # resizewin
        "CTRL+ALT,Up,resizewin,+0,-50"
        "CTRL+ALT,Down,resizewin,+0,+50"
        "CTRL+ALT,Left,resizewin,-50,+0"
        "CTRL+ALT,Right,resizewin,+50,+0"
      ];

      # Mouse Button Bindings
      # NONE mode key only work in ov mode
      mousebind = [
        "Super,btn_left,moveresize,curmove"
        "Super,btn_right,moveresize,curresize"
        "NONE,btn_left,toggleoverview,1"
      ];

      # layer rule
      layerrule = [
        "animation_type_open:zoom,layer_name:tofi-drun"
        "animation_type_close:zoom,layer_name:tofi-drun"
      ];

      # window rule
      windowrule = [
        "isfloating:1,height:398,width:700,offsety:99,offsetx:99,isglobal:1,isoverlay:1,title:Picture-in-Picture"
      ];

      monitorrule = [
        "eDP-1,0.55,1,tile,0,1,0,0,1920,1080,144"
        "HDMI-A-1,0.55,1,tile,0,1,1925,0,2560,1440,180"
      ];
    };
  };
}
