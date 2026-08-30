{
  lib,
  linux,
  ...
}:
{
  home.file = lib.optionalAttrs linux {
    ".config/niri/config.kdl".text = import ./config-kdl.nix;
  };
}
