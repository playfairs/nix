{
  lib,
  pkgs,
  linux,
  ...
}:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      font-awesome
      liberation_ttf
      noto-fonts
      noto-fonts-color-emoji
    ];
  }
  // lib.optionalAttrs linux {
    fontconfig.defaultFonts.monospace = [ "JetBrainsMono" ];
  };
}
