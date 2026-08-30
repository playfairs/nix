{
  linux,
  flakeConfig,
  ...
}:
{
  home = {
    homeDirectory =
      if !linux then "/Users/${flakeConfig.user.username}" else "/home/${flakeConfig.user.username}";
    username = flakeConfig.user.username;
    stateVersion = "24.11";
    sessionVariables.EDITOR = "hx";
  };
}
