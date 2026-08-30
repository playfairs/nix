{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.airspace;
  configFile =
    if cfg.settings != "" then pkgs.writeText "aerospace-config.toml" cfg.settings else null;
in
{
  options = {
    services.airspace = with lib.types; {
      enable = lib.mkEnableOption "AeroSpace window manager";
      package = lib.mkPackageOption pkgs "aerospace" { };

      settings = lib.mkOption {
        type = str;
        default = "";
        description = "TOML configuration file contents";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    launchd.user.agents.aerospace = {
      command =
        "${cfg.package}/Applications/AeroSpace.app/Contents/MacOS/AeroSpace"
        + (lib.optionalString (cfg.settings != "") " --config-path ${configFile}");
      serviceConfig = {
        KeepAlive = true;
        RunAtLoad = true;
      };
      managedBy = "services.aerospace.enable";
    };
  };
}
