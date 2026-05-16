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
  };

in
{
  options.my.starship.style = lib.mkOption {
    type = lib.types.enum [ "default" "minimal" ];
    default = "default";
    description = "Starship prompt style to use.";
  };

  config.programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
    settings = symbols // character // git // styles.${cfg.style};
  };
}