{
  lib,
  pkgs,
  linux,
  flakeConfig,
  ...
}:
lib.optionalAttrs linux {
  services.displayManager = with flakeConfig.system; {
    gdm = {
      enable = (greeter == "gdm");
      wayland = true;
    };

    ly = {
      enable = (greeter == "ly");
      settings = {

      };
    };

    sddm = {
      enable = (greeter == "sddm");
      enableHidpi = true;
      wayland.enable = true;
    };
  };
  programs = {
    niri.enable = flakeConfig.desktop.niri.enable or false;
    hyprland = {
      enable = flakeConfig.desktop.hyprland.enable or false;
      xwayland.enable = true;
    };
  };

  xdg.portal.enable = true;
}
