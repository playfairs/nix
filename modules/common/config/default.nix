{
  lib,
  linux,
  custils,
  flakeConfig,
  extraOverlays,
  allowUnfreePredicate,
  ...
}:
{
  imports =
    (custils.lib.getModulesFromDirRec ./. true)
    ++ lib.optionals linux [ flakeConfig.system.hardware-module ];

  nixpkgs = {
    config.allowUnfreePredicate = allowUnfreePredicate;
    overlays = extraOverlays;
  };

  system.stateVersion = if linux then "25.11" else 6;
}
