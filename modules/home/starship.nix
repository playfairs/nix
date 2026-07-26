{ config, lib, ... }:

let
  cfg = config.my.starship;

  # THEMES — colours only. Every non-"filled" format reads exclusively
  # from these generic keys, so any theme works with any of them:
  #   dir, branch, status, ok, danger, muted, toolchain, user, host, time

  themes = {
    tokyo_night = {
      dir = "#7dcfff";
      branch = "#bb9af7";
      status = "#e0af68";
      ok = "#9ece6a";
      danger = "#f7768e";
      muted = "#565f89";
      toolchain = "#73daca";
      user = "#bb9af7";
      host = "#565f89";
      time = "#7dcfff";
    };

    catppuccin = {
      dir = "#cba6f7";
      branch = "#89b4fa";
      status = "#a6e3a1";
      ok = "#a6e3a1";
      danger = "#f38ba8";
      muted = "#6c7086";
      toolchain = "#94e2d5";
      user = "#cba6f7";
      host = "#6c7086";
      time = "#fab387";
    };

    gruvbox = {
      dir = "#a9b665";
      branch = "#d8a657";
      status = "#e78a4e";
      ok = "#a9b665";
      danger = "#ea6962";
      muted = "#928374";
      toolchain = "#89b482";
      user = "#d3869b";
      host = "#928374";
      time = "#d8a657";
    };
  };

  # Shared building blocks every non-"filled" format is built from —
  # character symbols, directory/git colouring, last-commit, and every
  # language/toolchain module. All keyed off the generic theme names
  # above, so this is identical regardless of which theme gets passed in.

  mkPaletteBase = themeName: {
    palette = themeName;
    palettes.${themeName} = themes.${themeName};

    character = {
      error_symbol = "[ 󱞪 :](bold danger)";
      success_symbol = "[ 󱞪 :](bold ok)";
      vimcmd_replace_one_symbol = "[<](bold branch)";
      vimcmd_replace_symbol = "[<](bold branch)";
      vimcmd_symbol = "[<](bold ok)";
      vimcmd_visual_symbol = "[<](bold status)";
    };

    directory.style = "bold dir";
    directory.read_only = " ro";

    git_branch = {
      symbol = "󰊢 on ";
      truncation_symbol = "...";
      style = "branch";
    };

    git_status = {
      ahead = ">";
      behind = "<";
      deleted = "x";
      diverged = "<>";
      renamed = "r";
      style = "status";
    };

    custom.last_commit = {
      command = "git log -1 --pretty=format:'%h'";
      when = "git rev-parse --is-inside-work-tree";
      format = "[$output]($style) ";
      style = "muted";
    };

    package.symbol = "pkg ";
    package.style = "toolchain";
    bun.symbol = "bun ";
    bun.style = "toolchain";
    c.symbol = "c ";
    c.style = "toolchain";
    cmake.symbol = "cmake ";
    cmake.style = "toolchain";
    cpp.symbol = "c++ ";
    cpp.style = "toolchain";
    deno.symbol = "deno ";
    deno.style = "toolchain";
    golang.symbol = "go ";
    golang.style = "toolchain";
    haskell.symbol = "haskell ";
    haskell.style = "toolchain";
    haxe.symbol = "haxe ";
    haxe.style = "toolchain";
    nix_shell.symbol = "nix ";
    nix_shell.style = "toolchain";
    rust.symbol = "rust ";
    rust.style = "toolchain";
    swift.symbol = "swift ";
    swift.style = "toolchain";
    zig.symbol = "zig ";
    zig.style = "toolchain";
    dotnet = {
      format = "via [$symbol($version )(target $tfm )]($style)";
      symbol = ".net ";
      style = "toolchain";
    };
  };

  # FORMATS — layout only. Each takes a theme name and layers its own
  # `format` string / module toggles on top of `mkPaletteBase`. Any of
  # these four works with any theme above.

  mkDefault =
    themeName:
    mkPaletteBase themeName
    // {
      format = "$directory$git_branch$custom$git_status$bun$deno$rust$golang$haskell$haxe$zig$c$cpp$cmake$swift$dotnet$nix_shell$fill$username@$hostname $time\n$character";
      continuation_prompt = "[.](bright-black) ";
      username = {
        show_always = true;
        format = "[$user]($style)";
        style_user = "user";
      };
      hostname = {
        ssh_only = false;
        format = "[$hostname]($style)";
        style = "host";
      };
      time = {
        disabled = true;
        format = "[ $time]($style)";
        use_12hr = true;
        style = "time";
      };
      fill = {
        symbol = " ";
        style = "bright-white";
      };
    };

  mkMinimal =
    themeName:
    mkPaletteBase themeName
    // {
      format = "$directory$git_branch$git_status\n$character";
      continuation_prompt = "[.](bright-black) ";
      username.show_always = false;
      hostname.ssh_only = true;
      time.disabled = true;
    };

  mkFormat1 =
    themeName:
    mkPaletteBase themeName
    // {
      # the old tokyo_night layout
      format = "$directory$git_branch$git_status$package$bun$deno$rust$golang$haskell$haxe$zig$c$cpp$cmake$swift$dotnet$nix_shell$fill$custom\n$character";
      continuation_prompt = "[.](bright-black) ";
      fill = {
        symbol = " ";
        style = "bright-white";
      };
      username.show_always = false;
      hostname.ssh_only = true;
      time.disabled = true;
    };

  mkFormat2 =
    themeName:
    mkPaletteBase themeName
    // {
      # the old catppuccin layout
      format = "$directory$git_branch$custom$git_status$package$bun$deno$rust$golang$haskell$haxe$zig$c$cpp$cmake$swift$dotnet$nix_shell$time\n$character";
      continuation_prompt = "[.](bright-black) ";
      username = {
        show_always = true;
        format = "[$user]($style)";
        style_user = "user";
        style_root = "bold danger";
      };
      hostname = {
        ssh_only = false;
        format = "[@$hostname]($style)";
        style = "host";
      };
      time = {
        disabled = false;
        format = "[$time]($style)";
        style = "time";
        use_12hr = true;
        time_format = "%I:%M %p";
      };
    };

  # "filled" — the one format that stays fixed. Its powerline colours
  # don't map onto the generic theme keys, so it ignores `my.starship.theme`
  # entirely and is always this exact look.

  filledColours = {
    usernameFg = "#ebbcba";
    usernameBg = "#483d47";
    directoryFg = "#c4a7e7";
    directoryBg = "#403850";
    gitFg = "#9ccfd8";
    gitBg = "#286983";
  };

  filledFormat = {
    format = ''
      [](fg:${filledColours.usernameBg})[ 󱄅  ](bg:${filledColours.usernameBg} fg:${filledColours.usernameFg})$username[](bg:${filledColours.directoryBg} fg:${filledColours.usernameBg})$directory[](fg:${filledColours.directoryBg} bg:${filledColours.gitBg})$git_branch$git_status[](fg:${filledColours.gitBg} bg:#26233a)$nodejs$rust$golang$php[](fg:#26233a bg:#2a273f)$time[](fg:#2a273f)
      $character'';
    character = {
      error_symbol = "[ 󱞪](bold red)";
      success_symbol = "[ 󱞪](bold green)";
    };
    directory = {
      format = "[ $path ]($style)";
      style = "fg:${filledColours.directoryFg} bg:${filledColours.directoryBg}";
      truncation_length = 3;
      truncation_symbol = "…/";
      substitutions = {
        Downloads = " ";
        Documents = "󰈙 ";
        Music = " ";
        Pictures = " ";
        Movies = "󱜋 ";
        Videos = " ";
        Dev = " ";
        Developer = " ";
        dotfiles = " ";
        nix = "󱄅 ";
        ".nix" = "󱄅 ";
      };
    };
    git_branch = {
      format = "[[ $symbol$branch ](fg:${filledColours.gitFg} bg:${filledColours.gitBg})]($style)";
      symbol = "󰊢 ";
    };
    git_status = {
      format = "[[($all_status$ahead_behind )](fg:${filledColours.gitFg} bg:${filledColours.gitBg})]($style)";
      style = "bg:#394260";
    };
    golang = {
      format = "[[ $symbol ($version) ](fg:#908caa bg:#26233a)]($style)";
      style = "bg:#26233a";
      symbol = "";
    };
    nodejs = {
      format = "[[ $symbol ($version) ](fg:#908caa bg:#26233a)]($style)";
      style = "bg:#583e47";
      symbol = "";
    };
    php = {
      format = "[[ $symbol ($version) ](fg:#908caa bg:#26233a)]($style)";
      style = "bg:#26233a";
      symbol = "";
    };
    rust = {
      format = "[[ $symbol ($version) ](fg:#908caa bg:#26233a)]($style)";
      style = "bg:#26233a";
      symbol = "";
    };
    time = {
      disabled = false;
      format = "[[ $time ](fg:#908caa bg:#2a273f)]($style)";
      style = "bg:#584951";
      time_format = "%R";
    };
    username = {
      disabled = false;
      format = "[$user ]($style)";
      show_always = true;
      style_root = "red bold";
      style_user = "bg:${filledColours.usernameBg} fg:${filledColours.usernameFg} bold";
    };
  };

  settingsFor =
    if cfg.format == "filled" then
      filledFormat
    else if cfg.format == "default" then
      mkDefault cfg.theme
    else if cfg.format == "minimal" then
      mkMinimal cfg.theme
    else if cfg.format == "format1" then
      mkFormat1 cfg.theme
    else if cfg.format == "format2" then
      mkFormat2 cfg.theme
    else
      mkDefault cfg.theme;

in
{
  options.my.starship = {
    format = lib.mkOption {
      type = lib.types.enum [
        "default"
        "minimal"
        "format1"
        "format2"
        "filled"
      ];
      default = "format1";
      description = ''
        Structural layout of the starship prompt. "default", "minimal",
        "format1" (old tokyo_night layout), and "format2" (old catppuccin
        layout) are all interchangeable with any `my.starship.theme`.
        "filled" is a fixed powerline style with its own hardcoded
        colours — `my.starship.theme` has no effect on it.
      '';
    };

    theme = lib.mkOption {
      type = lib.types.enum (builtins.attrNames themes);
      default = "tokyo_night";
      description = ''
        Colour palette applied to any format except "filled".
      '';
    };
  };

  config.programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
    settings = settingsFor;
  };
}
