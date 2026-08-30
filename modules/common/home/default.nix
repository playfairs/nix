{
  custils,
  extraOverlays,
  allowUnfreePredicate,
  ...
}:
{
  imports = (custils.lib.getModulesFromDirRec ./. true);

  nixpkgs = {
    config.allowUnfreePredicate = allowUnfreePredicate;
    overlays = extraOverlays;
  };
}
