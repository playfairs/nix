{
  pkgs,
  linux,
  ...
}:
{
  security =
    if linux then
      {
        doas = {
          enable = true;
          extraRules = [
            {
              groups = [ "wheel" ];
              keepEnv = true;
              persist = true;
            }
          ];
        };
        sudo.enable = false;
        sudo-rs = {
          enable = true;
          extraRules = [
            {
              commands = [
                {
                  command = "${pkgs.systemd}/bin/reboot";
                  options = [ "NOPASSWD" ];
                }
              ];
              groups = [ "wheel" ];
            }
          ];
        };
        polkit.enable = true;
      }
    else
      {
        pam.services.sudo_local.touchIdAuth = true;
      };
}
