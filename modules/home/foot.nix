{
  lib,
  linux,
  ...
}:
lib.optionalAttrs linux {
  programs.foot = {
    enable = true;

    settings = {
      main.font = lib.mkForce "JetBrainsMono Nerd Font:size=14";

      colors.alpha = lib.mkForce 0.85;
    };
  };
}

