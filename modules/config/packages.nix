{
  lib,
  pkgs,
  linux,
  ...
}:
{
  environment = {
    shells = with pkgs; [
      bashInteractive
      nushell
    ];

    systemPackages =
      with pkgs;
      [
        jack2
        git
        helix
        home-manager
      ]
      ++ lib.optionals linux [
        ghostty
        zen
        pciutils
        xwayland-satellite
        swww
      ];
  }
  // lib.optionalAttrs linux {
    plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      gwenview
      discover
      dolphin
      konsole
      oxygen
      okular
      elisa
      kate
    ];
  };

  programs = lib.optionalAttrs linux {
    nix-ld.enable = true;
    steam = {
      enable = (!pkgs.stdenv.isx86_64);
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
    virt-manager.enable = true;
    dconf.enable = true;
    thunar.enable = true;
    nano.enable = false;
  };
}
