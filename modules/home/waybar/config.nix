''
  {
      "layer": "top",
      "position": "top",
      "height": 25,
      "spacing": 0,
      "margin-top": 0,
      "margin-left": 0,
      "margin-right": 0,
      "modules-left": [
        "custom/launcher",
        "ext/workspaces",
        "dwl/window"
      ],
      "modules-center": [
      ],
      "modules-right": [
        "network",
        "pulseaudio",
        "battery",
        "tray",
        "clock",
      ],
      "custom/launcher": {
        "format": "{}",
        "tooltip": true,
        "exec": "echo '{\"text\":\"󱄅 \",\"tooltip\":\"Drun | Run\"}'",
        "return-type": "json",
        "on-click": "bash -c 'pkill tofi-drun || tofi-drun --drun-launch=true'",
      },
      "hyprland/workspaces": {
        "format": "",
        "format-icons": {
            "active": "",
            "default": ""
        },
        "on-scroll-up": "hyprctl dispatch workspace e-1",
        "on-scroll-down": "hyprctl dispatch workspace e+1",
        "on-click": "activate"
      },
      "cpu": {
        "format": " {usage}%",
        "tooltip": true,
        "interval": 2
      },
      "memory": {
        "format": " {}%",
        "tooltip": true,
        "interval": 2
      },
      "temperature": {
          "critical-threshold": 40,
          "format-critical": "{icon} {temperatureC}°C",
          "format": "{icon} {temperatureC}°C",
          "format-icons": [
              "",
              "",
              ""
          ],
          "tooltip": true,
          "interval": 2
      },
      "disk": {
          "format": " {percentage_used}% ({free})",
          "tooltip": true,
          "interval": 2
      },
      "hyprland/window": {
          "format": "{}",
          "separate-outputs": true,
          "max-length": 35
      },
      "network": {
          "format": "↕ {bandwidthTotalBytes}",
          "format-disconnected": "{icon} No Internet",
          "format-linked": " {ifname} (No IP)",
          "format-alt": "↕{bandwidthUpBytes} | ↕{bandwidthDownBytes}",
          "tooltip-format": "{ifname}: {ipaddr}/{cidr}  {gwaddr}",
          "tooltip-format-wifi": "{icon} {essid} ({signalStrength}%)",
          "tooltip-format-ethernet": "{icon} {ipaddr}/{cidr}",
          "tooltip-format-disconnected": "{icon} Disconnected",
          "on-click-right": "nm-connection-editor",
          "format-icons": {
              "ethernet": "",
              "disconnected": "⚠",
              "wifi": [
                  "睊",
                  "直"
              ]
          },
          "interval": 2
      },
      "pulseaudio": {
          "format": "{icon}  {volume}%",
          "format-bluetooth": "{icon} {volume}%",
          "format-bluetooth-muted": "",
          "format-source": "{volume}% ",
          "format-source-muted": "",
          "format-muted": "",
          "format-icons": {
              "alsa_output.pci-0000_00_1f.3.analog-stereo": "",
              "alsa_output.pci-0000_00_1f.3.analog-stereo-muted": "",
              "headphones": "",
              "handsfree": "",
              "headset": "",
              "phone": "",
              "phone-muted": "",
              "portable": "",
              "car": "",
              "default": ["", ""]
          },
          "on-click": "pavucontrol"
      },
      "battery": {
          "states": {
              "good": 100,
              "warning": 30,
              "critical": 10
          },
          "format": "{icon} {capacity}%",
          "format-charging": " {capacity}%",
          "format-plugged": " {capacity}%",
          "format-alt": "{icon} {time}",
          "format-full": " {capacity}%",
          "format-icons": [
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              ""
          ],
          "interval": 2
      },
      "tray": {
          "icon-size": 15,
          "spacing": 15
      },
      "clock": {
          "format": " {:%d <small>%a</small> %H:%M}",
          "format-alt": " {:%A %B %d %Y (%V) | %r}",
          "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
          "calendar-weeks-pos": "right",
          "today-format": "<span color='#f38ba8'><b><u>{}</u></b></span>",
          "format-calendar": "<span color='#f2cdcd'><b>{}</b></span>",
          "format-calendar-weeks": "<span color='#94e2d5'><b>W{:%U}</b></span>",
          "format-calendar-weekdays": "<span color='#f9e2af'><b>{}</b></span>",
          "interval": 60
      },
  }
''
