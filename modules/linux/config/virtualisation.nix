{
  lib,
  linux,
  ...
}:
lib.optionalAttrs linux {
  virtualisation = {
    libvirtd.enable = true;

    spiceUSBRedirection.enable = true;

    vmVariant.virtualisation = {
      memorySize = 1024 * 32;
      cores = 8;
      diskSize = 128 * 1024;
    };
  };
}
