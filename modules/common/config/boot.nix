{
  lib,
  pkgs,
  linux,
  flakeConfig,
  ...
}:
let
  inherit (flakeConfig) system;
in
lib.optionalAttrs linux {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = with pkgs; [ linuxPackages_latest.v4l2loopback.out ];
    kernelModules = [ "v4l2loopback" ];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Virtual Camera" exclusive_caps=1
    '';
    kernelParams = system.kernelParams or [ ];
    blacklistedKernelModules = system.graphics.blacklists;

    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = system.boot.canTouchEfiVariables or true;
        efiSysMountPoint = system.boot.efiDirectory or "/boot/efi";
      };
    };

    kernel.sysctl = {
      "vm.swappiness" = 10;
    };
  };
}
