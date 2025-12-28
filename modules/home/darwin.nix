{
  lib,
  pkgs,
  config,
  flakeConfig,
  linux,
  ...
}:
let
  inherit (flakeConfig) system;
in
lib.optionalAttrs (!linux) {
  imports = [
    ../wallpaper.nix
    ../dock
  ];

  targets.darwin = {
    dock = {
      enable = true;
    }
    // pkgs.lib.optionalAttrs (flakeConfig.system ? dock && flakeConfig.system.dock ? entries) {
      entries = flakeConfig.system.dock.entries { inherit pkgs config; };
    };

    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = false;
        NSWindowShouldDragOnGesture = true; # Cmd + Ctrl to drag from window anywhere not needing it's chrome
        NSAutomaticSpellingCorrectionEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false; # Default save files to disk not iCloud
        NSTableViewDefaultSizeMode = 2; # Force set icon size to default value
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        AppleICUForce24HourTime = true;
        "com.apple.keyboard.fnState" = true;
        AppleTemperatureUnit = "Celsius";
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = true;
        AppleHighlightColor = "0.968627 0.831373 1.000000 Purple";
        AppleAccentColor = 5;
        KeyRepeat = 2;
      };

      "com.apple.screencapture" = {
        location = "~/Pictures";
        type = "png";
        target = "clipboard";
        disable-shadow = true;
      };

      "com.apple.WindowManager" = {
        EnableStandardClickToShowDesktop = false;
        GloballyEnabled = false;
      };

      "com.apple.menuextra.clock" = {
        Show24Hour = true;
        ShowSeconds = true;
      };

      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };

      "com.apple.finder" = {
        AppleShowAllExtensions = true;
        FXPreferredViewStyle = "Nlsv"; # List view
        FXDefaultSearchScope = "SCcf"; # Search the current folder
        _FXSortFoldersFirst = true; # List with directorys at first
        FinderSpawnTab = false; # Disable finder tabs (due to WM)
        FXRemoveOldTrashItems = true; # Delete bin in 30 days
        FXEnableExtensionChangeWarning = false; # Disable change fs-extension warning
        showWindowTitlebarIcons = false;
        NSToolbarTitleViewRolloverDelay = 0.2;
        AppleShowAllFiles = true;
        ShowPathbar = true;
        CreateDesktop = false;
        QuitMenuItem = true;
        NewWindowTarget = "Home";
      };

      "com.apple.dock" = {
        autohide = system.dock.autohide or false;
        orientation = system.dock.orientation or "bottom";
        tilesize = system.dock.size or 100;
        minimize-to-application = true;
        show-recents = false;
        wvous-br-corner = 1;
        size-immutable = true;
      };

      "com.apple.CloudSubscriptionFeatures.optIn"."545129924" = false; # Disable AI bullshit
    };
  };

  programs.setWallpaper = {
    enable = true;
    wallpaperPath = flakeConfig.user.wallpaper or ../../wallpapers/macos.jpg;
  };
}
