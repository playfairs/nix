{
  lib,
  config,
  pkgs,
  linux,
  ...
}:

lib.optionalAttrs linux {
  config = lib.mkIf (!pkgs.stdenv.hostPlatform.isx86_64) {
    hardware.graphics.enable32Bit = lib.mkForce false;
  };
}
