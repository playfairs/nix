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
      symbol = "git ";
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
          Dev = " ";
          Developer = " ";
          dotfiles = " ";
          nix = "󱄅 ";
          ".nix" = "󱄅 ";
        };
      };
      git_branch = {
        format = "[[ $symbol $branch ](fg:${colours.gitFg} bg:${colours.gitBg})]($style)";
        symbol = "";
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
        format = "[[   $time ](fg:#908caa bg:#2a273f)]($style)";
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

in
{
  options.my.starship.style = lib.mkOption {
    type = lib.types.enum [ "default" "minimal" "filled" ];
    default = "default";
    description = "Starship prompt style to use.";
  };

  config.programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
    # `filled` defines its own character/git/directory overrides so we skip
    # the shared sets for it — they'd conflict with the powerline formatting.
    settings = if cfg.style == "filled"
      then styles.filled
      else symbols // character // git // styles.${cfg.style};
  };
}