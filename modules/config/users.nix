{
  lib,
  pkgs,
  linux,
  darwin,
  flakeConfig,
  ...
}:
let
  inherit (flakeConfig) user;
in
{
  users = {
    users.${user.username} = {
      name = user.username;
      description = user.displayName;
      shell = pkgs.zsh;
    }
    // lib.optionalAttrs linux {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "docker"
        "wheel"
        "libvirtd"
        "audio"
      ];
    }
    // lib.optionalAttrs darwin {
      home = "/Users/${flakeConfig.user.username}";
      uid = 501;
    };
  }
  // lib.optionalAttrs darwin {
    knownUsers = [ flakeConfig.user.username ];
  };
}
// lib.optionalAttrs darwin {
  system.primaryUser = user.username;
}
