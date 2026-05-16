{ config, lib, ... }:

let
  cfg = config.my.starship;

  symbols = {
    bun.symbol = "bun ";
    c.symbol = "c ";
    cmake.symbol = "cmake ";
    cpp.symbol = "c++ ";
    deno.symbol = "deno ";
    directory.read_only = " ro";
    dotnet = {
      format = "via [$symbol($version )(target $tfm )]($style)";
      symbol = ".net ";
    };
    haskell.symbol = "haskell ";
    haxe.symbol = "haxe ";
    nix_shell.symbol = "nix ";
    package.symbol = "pkg ";
    rust.symbol = "rust ";
    swift.symbol = "swift ";
    zig.symbol = "zig ";
  };

  character = {
    character = {
      error_symbol = "[ 󱞪 :](bold red)";
      success_symbol = "[ 󱞪 :](bold green)";
      vimcmd_replace_one_symbol = "[<](bold purple)";
      vimcmd_replace_symbol = "[<](bold purple)";
      vimcmd_symbol = "[<](bold green)";
      vimcmd_visual_symbol = "[<](bold yellow)";
    };
  };

  git = {
    custom.last_commit = {
      command = "git log -1 --pretty=format:'%h'";
      when = "git rev-parse --is-inside-work-tree";
      format = "[$output]($style) ";
      style = "yellow";
    };
    git_branch = {
      symbol = " ";
      truncation_symbol = "...";
    };
    git_status = {
      ahead = ">";
      behind = "<";
      deleted = "x";
      diverged = "<>";
      renamed = "r";
    };
  };

  colours = {
    usernameFg = "#ebbcba";
    usernameBg = "#483d47";
    directoryFg = "#c4a7e7";
    directoryBg = "#403850";
    gitFg = "#9ccfd8";
    gitBg = "#286983";
  };

  styles = {
    default = {
      format = "$directory$git_branch$custom$git_status$bun$deno$rust$golang$haskell$haxe$zig$c$cpp$cmake$swift$dotnet$nix_shell$fill$username@$hostname $time\n$character";
      continuation_prompt = "[.](bright-black) ";
      username = {
        show_always = true;
        format = "[$user]($style)";
      };
      hostname = {
        ssh_only = false;
        format = "[$hostname]($style)";
      };
      time = {
        disabled = true;
        format = "[ $time]($style)";
        use_12hr = true;
      };
      fill = {
        symbol = " ";
        style = "bright-white";
      };
    };

    minimal = {
      format = "$directory$git_branch$git_status\n$character";
      continuation_prompt = "[.](bright-black) ";
      username.show_always = false;
      hostname.ssh_only = true;
      time.disabled = true;
    };

    filled = {
      format = ''
        [](fg:${colours.usernameBg})[ 󱄅  ](bg:${colours.usernameBg} fg:${colours.usernameFg})$username[](bg:${colours.directoryBg} fg:${colours.usernameBg})$directory[](fg:${colours.directoryBg} bg:${colours.gitBg})$git_branch$git_status[](fg:${colours.gitBg} bg:#26233a)$nodejs$rust$golang$php[](fg:#26233a bg:#2a273f)$time[](fg:#2a273f)
        $character'';
      character = {
        error_symbol = "[ 󱞪](bold red)";
        success_symbol = "[ 󱞪](bold green)";
      };
      directory = {
        format = "[ $path ]($style)";
        style = "fg:${colours.directoryFg} bg:${colours.directoryBg}";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          Downloads = " ";
          Documents = "󰈙 ";
          Music = " ";
          Pictures = " ";
          Movies = " ";
          Videos = " ";
          Dev = " ";
          Developer = " ";
          dotfiles = " ";
          nix = "󱄅 ";
          ".nix" = "󱄅 ";
        };
      };
      git_branch = {
        format = "[[ $symbol $branch ](fg:${colours.gitFg} bg:${colours.gitBg})]($style)";
        symbol = " ";
      };
      git_status = {
        format = "[[($all_status$ahead_behind )](fg:${colours.gitFg} bg:${colours.gitBg})]($style)";
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
        style_user = "bg:${colours.usernameBg} fg:${colours.usernameFg} bold";
      };
    };

    tokyo_night = {
      format = "$directory$git_branch$custom$git_status$package$bun$deno$rust$golang$haskell$haxe$zig$c$cpp$cmake$swift$dotnet$nix_shell\n$character";
      continuation_prompt = "[.](bright-black) ";
      palette = "tokyo_night";
      palettes.tokyo_night = {
        dir       = "#7dcfff";
        branch    = "#bb9af7";
        status    = "#e0af68";
        ok        = "#9ece6a";
        danger    = "#f7768e";
        muted     = "#565f89";
        toolchain = "#73daca";
      };
      character = {
        error_symbol   = "[ 󱞪 :](bold danger)";
        success_symbol = "[ 󱞪 :](bold ok)";
        vimcmd_replace_one_symbol = "[<](bold branch)";
        vimcmd_replace_symbol     = "[<](bold branch)";
        vimcmd_symbol             = "[<](bold ok)";
        vimcmd_visual_symbol      = "[<](bold status)";
      };
      directory = {
        format = "[$path]($style) ";
        style  = "bold dir";
        truncation_length = 3;
        truncation_symbol = "…/";
      };
      git_branch = {
        format = "[$symbol$branch]($style) ";
        style  = "branch";
        symbol = " ";
        truncation_symbol = "...";
      };
      git_status = {
        format   = "([$all_status$ahead_behind]($style) )";
        style    = "status";
        ahead    = ">";
        behind   = "<";
        deleted  = "x";
        diverged = "<>";
        renamed  = "r";
      };
      custom.last_commit = {
        command = "git log -1 --pretty=format:'%h'";
        when    = "git rev-parse --is-inside-work-tree";
        format  = "[$output]($style) ";
        style   = "muted";
      };
      package = {
        format = "[$symbol$version]($style) ";
        style  = "toolchain";
        symbol = "pkg ";
      };
      rust   = { symbol = "rust ";   style = "toolchain"; };
      golang = { symbol = "go ";     style = "toolchain"; };
      bun    = { symbol = "bun ";    style = "toolchain"; };
      deno   = { symbol = "deno ";   style = "toolchain"; };
      nix_shell = { symbol = "nix "; style = "toolchain"; };
      username.show_always = false;
      hostname.ssh_only    = true;
      time.disabled        = true;
    };

    catppuccin = {
      format = "$username$hostname $directory$git_branch$custom$git_status$bun$deno$rust$golang$haskell$haxe$zig$c$cpp$cmake$swift$dotnet$nix_shell $time\n$character";
      continuation_prompt = "[.](bright-black) ";
      palette = "catppuccin_mocha";
      palettes.catppuccin_mocha = {
        mauve  = "#cba6f7";
        blue   = "#89b4fa";
        green  = "#a6e3a1";
        peach  = "#fab387";
        red    = "#f38ba8";
        teal   = "#94e2d5";
        subtext = "#6c7086";
      };
      character = {
        error_symbol   = "[ 󱞪 :](bold red)";
        success_symbol = "[ 󱞪 :](bold green)";
        vimcmd_replace_one_symbol = "[<](bold mauve)";
        vimcmd_replace_symbol     = "[<](bold mauve)";
        vimcmd_symbol             = "[<](bold green)";
        vimcmd_visual_symbol      = "[<](bold peach)";
      };
      username = {
        show_always = true;
        format      = "[$user]($style)";
        style_user  = "mauve";
        style_root  = "bold red";
      };
      hostname = {
        ssh_only = false;
        format   = "[@$hostname]($style)";
        style    = "subtext";
      };
      directory = {
        format = "[$path]($style) ";
        style  = "bold mauve";
        truncation_length = 3;
        truncation_symbol = "…/";
      };
      git_branch = {
        format = "[$symbol$branch]($style) ";
        style  = "blue";
        symbol = " ";
        truncation_symbol = "...";
      };
      git_status = {
        format   = "([$all_status$ahead_behind]($style) )";
        style    = "green";
        ahead    = ">";
        behind   = "<";
        deleted  = "x";
        diverged = "<>";
        renamed  = "r";
      };
      custom.last_commit = {
        command = "git log -1 --pretty=format:'%h'";
        when    = "git rev-parse --is-inside-work-tree";
        format  = "[$output]($style) ";
        style   = "subtext";
      };
      time = {
        disabled    = false;
        format      = "[$time]($style)";
        style       = "peach";
        use_12hr    = true;
        time_format = "%I:%M %p";
      };
      rust      = { symbol = "rust ";  style = "teal"; };
      golang    = { symbol = "go ";    style = "teal"; };
      bun       = { symbol = "bun ";   style = "teal"; };
      deno      = { symbol = "deno ";  style = "teal"; };
      nix_shell = { symbol = "nix ";   style = "teal"; };
    };

    gruvbox = {
      format = "$username$hostname $directory$git_branch$custom$git_status$bun$deno$rust$golang$haskell$haxe$zig$c$cpp$cmake$swift$dotnet$nix_shell\n$character";
      continuation_prompt = "[.](bright-black) ";
      palette = "gruvbox_material";
      palettes.gruvbox_material = {
        yellow  = "#d8a657";
        green   = "#a9b665";
        orange  = "#e78a4e";
        red     = "#ea6962";
        purple  = "#d3869b";
        aqua    = "#89b482";
        muted   = "#928374";
      };
      character = {
        error_symbol   = "[ 󱞪 :](bold red)";
        success_symbol = "[ 󱞪 :](bold green)";
        vimcmd_replace_one_symbol = "[<](bold purple)";
        vimcmd_replace_symbol     = "[<](bold purple)";
        vimcmd_symbol             = "[<](bold green)";
        vimcmd_visual_symbol      = "[<](bold yellow)";
      };
      username = {
        show_always = true;
        format      = "[$user]($style)";
        style_user  = "purple";
        style_root  = "bold red";
      };
      hostname = {
        ssh_only = false;
        format   = "[@$hostname]($style) ";
        style    = "muted";
      };
      directory = {
        format = "[$path]($style) ";
        style  = "bold green";
        truncation_length = 3;
        truncation_symbol = "…/";
      };
      git_branch = {
        format = "[$symbol$branch]($style) ";
        style  = "yellow";
        symbol = " ";
        truncation_symbol = "...";
      };
      git_status = {
        format   = "([$all_status$ahead_behind]($style) )";
        style    = "orange";
        ahead    = ">";
        behind   = "<";
        deleted  = "x";
        diverged = "<>";
        renamed  = "r";
      };
      custom.last_commit = {
        command = "git log -1 --pretty=format:'%h'";
        when    = "git rev-parse --is-inside-work-tree";
        format  = "[$output]($style) ";
        style   = "muted";
      };
      rust      = { symbol = "rust ";  style = "aqua"; };
      golang    = { symbol = "go ";    style = "aqua"; };
      bun       = { symbol = "bun ";   style = "aqua"; };
      deno      = { symbol = "deno ";  style = "aqua"; };
      nix_shell = { symbol = "nix ";   style = "aqua"; };
    };
  };

in
{
  options.my.starship.style = lib.mkOption {
    type = lib.types.enum [
      "default" "minimal" "filled"
      "tokyo_night" "catppuccin" "gruvbox"
    ];
    default = "default";
    description = "Starship prompt style to use.";
  };

  config.programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
    # `filled` defines its own character/git/directory overrides so we skip
    # the shared sets for it, they would conflict with the powerline formatting
    # the new palette-based styles also define their own full config sets.
    settings =
      if cfg.style == "filled"      then styles.filled
      else if cfg.style == "tokyo_night" then styles.tokyo_night
      else if cfg.style == "catppuccin"  then styles.catppuccin
      else if cfg.style == "gruvbox"     then styles.gruvbox
      else symbols // character // git // styles.${cfg.style};
  };
}
