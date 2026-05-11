{
  flakeConfig,
  lib,
  pkgs,
  ...
}:
let
  useOldGit = flakeConfig ? development && flakeConfig.development ? git;

  useHg =
    flakeConfig ? development
    && flakeConfig.development ? scm
    && flakeConfig.development.scm ? mercurial;

  gitConfig =
    if useOldGit then
      lib.warnIf true
        "The config option development.git is deprecated. Please use development.scm.git instead."
        flakeConfig.development.git
    else if
      flakeConfig ? development && flakeConfig.development ? scm && flakeConfig.development.scm ? git
    then
      flakeConfig.development.scm.git
    else
      { };
in
{
  assertions = [
    {
      assertion = !(useOldGit && useHg);
      message = ''
        You have specified development.scm.mercurial whilst using development.git.
        Please use development.scm.git instead.
      '';
    }
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = gitConfig.username or "playfairs";
        email = gitConfig.email or "root@playfairs.cc";
      };
      alias = {
        p = "push -v";
        c = "commit";
        ac = "commit --amend";
        pp = "pull";
        a = "add .";
        s = "switch";
        b = "branch";
      };
      init.defaultBranch = gitConfig.defaultBranch or "main";
      core.quotepath = "off";
    };
  };

  programs.mercurial = lib.optionalAttrs useHg (
    with flakeConfig.development.scm;
    {
      enable = mercurial.enable or false;
      userName = mercurial.username or "default-username";
      userEmail = mercurial.email or "default@example.com";
      extraConfig = {
        init.defaultBranch = mercurial.defaultBranch or "main";
      };
      aliases = {
        p = "push";
        c = "commit";
        a = "commit --amend";
      };
    }
  );

  home.packages = with pkgs; [
    lazygit
    glab
    gh
  ];
}
