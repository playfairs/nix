{
  lib,
  pkgs,
  linux,
  ...
}:
{
  programs.obs-studio = lib.optionalAttrs linux (
    with pkgs;
    {
      enable = true;
      package = obs-studio;
    }
  );
}
