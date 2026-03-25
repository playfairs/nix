{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    elvish
  ];

  xdg.configFile."elvish/rc.elv".text = ''
    eval (starship init elvish)
  '';
}
