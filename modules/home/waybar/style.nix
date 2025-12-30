''
  @define-color base  #191724;
  @define-color surface #1f1d2e;
  @define-color mantle #1f1d2e;
  @define-color crust #11111b;

  @define-color text #e0def4;
  @define-color subtext0 #a6adc8;
  @define-color subtext1 #bac2de;

  @define-color surface0 rgba(22, 25, 37, 0.9);
  @define-color surface1 #45475a;
  @define-color surface2 #585b70;
  @define-color surface3 #394161;

  @define-color overlay0 #6c7086;
  @define-color overlay1 #7f849c;
  @define-color overlay2 #9ba3c3;

  @define-color blue #89b4fa;
  @define-color lavender #c4a7e7;
  @define-color sapphire #74c7ec;
  @define-color sky #ebbcba;
  @define-color teal #94e2d5;
  @define-color green #9ccfd8;
  @define-color yellow #f9e2af;
  @define-color peach #fab387;
  @define-color maroon #eba0ac;
  @define-color red #eb6f92;
  @define-color mauve #cba6f7;
  @define-color pink #f5c2e7;
  @define-color flamingo #f2cdcd;
  @define-color rosewater #f5e0dc;

  /* =============================== */
  /* Universal Styling */
  * {
    border: none;
    border-radius: 0;
    font-family: 'JetBrains Mono Nerd Font';
    font-size: 16px;
    min-height: 0;
  }

  /* =============================== */


  /* =============================== */
  /* Bar Styling */
  #waybar {
    background: @base;
    color: @text;
  }

  /* =============================== */


  /* =============================== */
  /* Main Modules */
  #custom-launcher,
  #workspaces,
  #window,
  #tray,
  #backlight,
  #clock,
  #battery,
  #pulseaudio,
  #network,
  #mpd,
  #cpu,
  #memory,
  #disk,
  #temperature,
  #custom-music,
  #custom-updates,
  #custom-nordvpn,
  #custom-notifications,
  #custom-power,
  #custom-custom,
  #custom-cycle_wall,
  #custom-clipboard,
  #custom-ss,
  #custom-weather {
    background-color: @surface;
    color: @text;
    border-radius: 5px;
    padding: 5px 1rem;
    margin-top: 8px;
    margin-bottom: 8px;
    margin-right: 15px;
  }

  #custom-power {
    margin-right: 0;
  }

  /* =============================== */
  /* Launcher Module */
  #custom-launcher {
    color: #9ccfd8;
    font-size: 27px;
    font-weight: bold;
    padding-top: 0px;
    padding-bottom: 0px;
    padding-left: 9px;
    padding-right: 0px;
    margin-left: 30px
  }

  /* =============================== */
  /* Workspaces */
  #workspaces {
    padding-left: 8px;
    padding-right: 8px;
  }

  #workspaces * {
    font-size: 0px;
  }

  #workspaces button {
    background-color: @surface3;
    color: @mauve;
    border-radius: 100%;
    min-height: 14px;
    min-width: 17px;
    margin: 5px 8px;
    padding: 0px;
    box-shadow: rgba(0, 0, 0, 0.288) 2px 2px 5px 2px;
  }

  #workspaces button.active {
    background: radial-gradient(circle, rgba(203, 166, 247, 1) 0%, rgba(193, 168, 247, 1) 12%, rgba(249, 226, 175, 1) 19%, rgba(189, 169, 247, 1) 20%, rgba(182, 171, 247, 1) 24%, rgba(198, 255, 194, 1) 36%, rgba(177, 172, 247, 1) 37%, rgba(170, 173, 248, 1) 48%, rgba(255, 255, 255, 1) 52%, rgba(166, 174, 248, 1) 52%, rgba(160, 175, 248, 1) 59%, rgba(148, 226, 213, 1) 66%, rgba(155, 176, 248, 1) 67%, rgba(152, 177, 248, 1) 68%, rgba(205, 214, 244, 1) 77%, rgba(148, 178, 249, 1) 78%, rgba(144, 179, 250, 1) 82%, rgba(180, 190, 254, 1) 83%, rgba(141, 179, 250, 1) 90%, rgba(137, 180, 250, 1) 100%);
    background-size: 400% 400%;
    animation: gradient_f 20s ease-in-out infinite;
    transition: all 0.3s cubic-bezier(.55, -0.68, .48, 1.682);
  }

  #workspaces button:hover {
    background-color: @mauve;
  }

  @keyframes gradient {
    0% {
      background-position: 0% 50%;
    }

    50% {
      background-position: 100% 30%;
    }

    100% {
      background-position: 0% 50%;
    }
  }

  @keyframes gradient_f {
    0% {
      background-position: 0% 200%;
    }

    50% {
      background-position: 200% 0%;
    }

    100% {
      background-position: 400% 200%;
    }
  }

  @keyframes gradient_f_nh {
    0% {
      background-position: 0% 200%;
    }

    100% {
      background-position: 200% 200%;
    }
  }

  /* =============================== */


  /* =============================== */
  /* System Monitoring Modules */
  #cpu,
  #memory,
  #temperature {
    color: @blue;
  }

  #memory {
    border-radius: 0px;
  }

  #temperature {
    border-radius: 0px;
  }

  #disk {
    color: @peach;
    border-radius: 0px;
  }

  /* =============================== */
  /* Clock Module */
  #clock {
    color: @flamingo;
    margin-right: 30px;
  }

  /* =============================== */
  /* Network Module */
  #network {
    color: @blue;
  }

  /* =============================== */


  /* =============================== */
  /* PulseAudio Module */
  #pulseaudio {
    color: @mauve;
  }

  /* =============================== */


  /* =============================== */
  /* Battery Module */
  #battery {
    color: @green;
  }

  #battery.charging {
    color: @green;
  }

  #battery.warning:not(.charging) {
    color: @maroon;
  }

  #battery.critical:not(.charging) {
    color: @red;
    animation-name: blink;
    animation-duration: 1s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
  }

  @keyframes blink {
    to {
      background: @red;
      color: @surface1;
    }
  }

  /* =============================== */
  /* Tray Module */
  #tray {
    color: @mauve;
    padding-right: 1.25rem;
  }
''