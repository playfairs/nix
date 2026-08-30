{
  pkgs,
  linux,
  flakeConfig,
  ...
}:
let
  enable = (flakeConfig.plasma.enable or false) && linux;
in
{
  home.packages = pkgs.lib.optionals enable (
    with pkgs;
    [
      plasma-panel-colorizer
      kdePackages.krohnkite
      kde-rounded-corners
    ]
  );
  programs.plasma = {
    inherit enable;

    workspace = {
      clickItemTo = "select";
      lookAndFeel = "stylix";
      enableMiddleClickPaste = false;
    };

    panels = [
      {
        location = "top";
        hiding = "autohide";
        floating = true;

        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];

    hotkeys.commands."launch-ghostty" = {
      key = "Meta+Return";
      name = "Launch Ghostty";
      command = "ghostty";
      comment = "Launch Ghostty terminal.";
    };

    shortcuts = {
      ksmserver."Lock Session" = [
        "Screensaver"
        "Meta+L"
      ];

      kwin = {
        "Window Close" = "";
        "Window Fullscreen" = "Alt+Return,,Make Window Fullscreen";
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+L";
        "Switch Window Up" = "Meta+K";

        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
        "Switch to Desktop 6" = "Meta+6";
        "Switch to Desktop 7" = "Meta+7";
        "Switch to Desktop 8" = "Meta+8";
        "Switch to Desktop 9" = "Meta+9";

        "Window to Desktop 1" = "Meta+!";
        "Window to Desktop 2" = "Meta+@";
        "Window to Desktop 3" = "Meta+#";
        "Window to Desktop 4" = "Meta+$";
        "Window to Desktop 5" = "Meta+%";
        "Window to Desktop 6" = "Meta+^";
        "Window to Desktop 7" = "Meta+&";
        "Window to Desktop 8" = "Meta+*";
        "Window to Desktop 9" = "Meta+(";
      };
    };

    configFile = {
      "kdeglobals"."Shortcuts"."Quit" = "Meta+Q";
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "kwinrc"."org.kde.kdecoration2"."ButtonsOnLeft" = "SF";
      "kwinrc"."Desktops" = {
        "Rows" = 3;
        "Number" = {
          value = 9;
          immutable = true;
        };
      };
    };

    krunner = {
      position = "center";
    };

    window-rules = [
      {
        description = "Set PiP";
        apply = {
          desktops = {
            apply = "force";
            value = "\\0";
          };
          above = {
            apply = "force";
            value = true;
          };
          position = {
            apply = "initially";
            value = "-1,-1";
          };
        };
        match.title = {
          type = "exact";
          value = "Picture-in-Picture";
        };
      }
    ];
  };
}
