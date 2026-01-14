{
  ...
}:
let
  colours = {
    # usernameFg = "# ebbcba"; # Rose Pine
    # usernameBg = "# 483d47"; # Rose Pine

    usernameFg = "#483d47"; # Rose Pine Dawn
    usernameBg = "#ebbcba"; # Rose Pine Dawn

    # directoryFg = "# c4a7e7"; # Rose Pine
    # directoryBg = "# 403850"; # Rose Pine

    directoryFg = "#403850"; # Rose Pine Dawn
    directoryBg = "#c4a7e7"; # Rose Pine Dawn

    # gitFg = "# 9ccfd8"; # Rose Pine
    # gitBg = "# 286983"; # Rose Pine

    gitFg = "#286983"; # Rose Pine Dawn
    gitBg = "#9ccfd8"; # Rose Pine Dawn

  };
  # Background is 35-parts #1A1825 to 10-parts foreground.
in
{
  programs.starship = {
    enable = true;
    settings = {
      character = {
        error_symbol = "[ 󱞪](bold red)";
        success_symbol = "[ 󱞪](bold green)";
      };
      directory = {
        format = "[ $path ]($style)";
        style = "fg:${colours.directoryFg} bg:${colours.directoryBg}";
        substitutions = {
          Downloads = " ";
          Documents = "󰈙 ";
          Music = " ";
          Pictures = " ";
          Movies = " ";
          Videos = " ";
          Dev = " ";
          Developer = " ";

          dotfiles = " ";
          nix = "󱄅 ";
          ".nix" = "󱄅 ";
        };
        truncation_length = 3;
        truncation_symbol = "…/";
      };
      format = ''
        [](fg:${colours.usernameBg})[ 󱄅  ](bg:${colours.usernameBg} fg:${colours.usernameFg})$username[](bg:${colours.directoryBg} fg:${colours.usernameBg})$directory[](fg:${colours.directoryBg} bg:${colours.gitBg})$git_branch$git_status[](fg:${colours.gitBg} bg:#26233a)$nodejs$rust$golang$php[](fg:#26233a bg:#2a273f)$time[](fg:#2a273f)
        $character'';
      git_branch = {
        format = "[[ $symbol $branch ](fg:${colours.gitFg} bg:${colours.gitBg})]($style)";
        symbol = "";
      };
      git_status = {
        format = "[[($all_status$ahead_behind )](fg:${colours.gitFg} bg:${colours.gitBg})]($style)";
        style = "bg:#394260";
      };
      golang = {
        format = "[[ $symbol ($version) ](fg:#908caa bg:#26233a)]($style)";
        style = "bg:#26233a";
        symbol = "";
      };
      nodejs = {
        format = "[[ $symbol ($version) ](fg:#908caa bg:#26233a)]($style)";
        style = "bg:#583e47";
        symbol = "";
      };
      php = {
        format = "[[ $symbol ($version) ](fg:#908caa bg:#26233a)]($style)";
        style = "bg:#26233a";
        symbol = "";
      };
      rust = {
        format = "[[ $symbol ($version) ](fg:#908caa bg:#26233a)]($style)";
        style = "bg:#26233a";
        symbol = "";
      };
      time = {
        disabled = false;
        format = "[[   $time ](fg:#908caa bg:#2a273f)]($style)";
        style = "bg:#584951";
        time_format = "%R";
      };
      username = {
        disabled = false;
        format = "[$user ]($style)";
        show_always = true;
        style_root = "red bold";
        style_user = "bg:${colours.usernameBg} fg:${colours.usernameFg} bold";
      };
    };
  };
}
