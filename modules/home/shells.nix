{
  pkgs,
  darwin,
  lib,
  flakeConfig,
  nushell,
  ...
}:
let
  inherit (flakeConfig) user;

in
{
  imports = [
    ./elvish.nix
  ];

  home.sessionVariables = {
    # EDITOR = "${pkgs.helix}/bin/hx";
    # VISUAL = "${pkgs.helix}/bin/hx";

    NH_FLAKE = "$HOME/.nix";
    NH_OS_FLAKE = "$HOME/.nix";
    NH_DARWIN_FLAKE = "$HOME/.nix";
    NH_HOME_FLAKE = "$HOME/.nix";
  };

  home.sessionPath = [
    "$HOME/.nix-profile/bin"
    "/nix/var/nix/profiles/default/bin"
    "/etc/profiles/per-user/${user.username}/bin"
    "/run/current-system/sw/bin"
    "$HOME/.spicetify"
  ];

  programs.zsh = {
    enable = true;
    initContent = ''
      fastfetch

      bindkey '^R' fzf-history-widget
      bindkey -s '^[[104;6u' 'hm\n'

      fzf_open_hx() {
        local file
        file=$(fzf) && hx "$file"
      }
      bindkey -s '^F' 'fzf_open_hx\n'

      hx () {
        if [[ -e "$1" ]]; then
          command hx "$@"
          return
        fi

        local file

        for ext in nix rs py js ts json toml yam yml md go html; do
          file=$(fd "$1" -e $ext | head -n1)
          [[ -n "$file" ]] && break
        done

        [[ -z "$file" ]] && file=$(fd "$1" | head -n1)

        if [[ -n "$file" ]]; then
          command hx "$file"
        else
          command hx "$1"
        fi
      }

    '';

    # Throwing this out of initContent because putting comments inside it makes it slower since it still tries to run stuff
    # fastfetch --logo none
    # fastfetch --logo none | lolcat -a -d 8 -s 1000 -t
    # echo "hi ${user.username}, the current time is `date +'%I:%M:%S %p'`" | lolcat


    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    shellAliases = {
      ":q" = "exit";
      ".." = "cd ..";
      "-" = "cd -";
      fuckoff = "exit";
      l = "ls -l";
      la = "ls -la";
      ani = "ani-cli --dub";
      anid = "ani-cli -d -q 1440p --dub -e 1-999";
      # uuid = "uuidgen | tr '[:upper:]' '[:lower:]'";
      lazy = "lazygit";
      edit = "hx";
      please = "sudo";
      fuck = "touch";
      nv = "nvim";
      neovim = "nvim";
      vimproved = "vim";
      hmm = "echo 'bros unsure'";
      ff = "fastfetch";
      copy = "cp";
      urban = "urban-cli -m 1";
      py = "python3";
    }
    // lib.optionalAttrs darwin {
      hm = "nh home switch -c macmini";
      "hm," = "nh home switch -c macmini"; # Somehow I manage to type 'hm,' more often than not
      mh = "nh home switch -c macmini"; # Also manage to type this occasionally
      skip = "osascript -e 'tell app \"Spotify\" to next track'";
      prev = "osascript -e 'tell app \"Spotify\" to previous track'";
      np="osascript -e 'tell application \"Spotify\" to get artist of current track & \" - \" & name of current track & \" (\" & album of current track & \")\"'";
      savetrack = "osascript -e 'tell application \"Spotify\" to activate' -e 'tell application \"System Events\" to keystroke \"l\" using {command down, shift down}'";
      loop = "osascript -e 'tell application \"Spotify\" to set repeating to true'";
    };
  };

  programs.nushell = {
    enable = false;
    package = nushell.packages.${pkgs.stdenv.hostPlatform.system}.nushell;

    settings = {
      show_banner = false;
      use_kitty_protocol = true;
      buffer_editor = "hx";

      completions.external = {
        enable = true;
        max_results = 10000;
      };
    };

    shellAliases = {
      fuckoff = "exit";
      ":q" = "exit";
      l = "ls -l";
      urban = "urban-cli -m 1";
      la = "ls -la";
      please = "sudo";
      fuck = "touch";
      nv = "nvim";
      vimproved = "vim";
      hmm = "echo 'bros unsure'";
      ff = "fastfetch";
      copy = "cp";
    }
    // lib.optionalAttrs darwin {
      hm = "nh home switch -c macmini";
    };

    # extraConfig = ''
    #   #!/bin/nu
    #   $env.LS_COLORS = (${pkgs.vivid}/bin/vivid generate rose-pine)
    #   $env.EDITOR = "${pkgs.helix}/bin/hx";
    #   $env.VISUAL = "${pkgs.helix}/bin/hx";
    #   $env.NH_FLAKE = $"($env.HOME)/.nix";
    #   $env.NH_OS_FLAKE = $"($env.HOME)/.nix";
    #   $env.NH_DARWIN_FLAKE = $"($env.HOME)/.nix";
    #   $env.NH_HOME_FLAKE = $"($env.HOME)/.nix";
    #   $env.PATH = $env.PATH
    #   | append [
    #     "/${if darwin then "Users" else "home"}/${user.username}/.nix-profile/bin"
    #     "/nix/var/nix/profiles/default/bin"
    #     "/etc/profiles/per-user/${user.username}/bin"
    #     "/run/current-system/sw/bin"
    #   ]

    #   if not ((("NU_EXISTING_INSTANCE" in $env)) and ($env.NU_EXISTING_INSTANCE == true)) {
    #     sleep 50ms
    #     ${pkgs.fortune}/bin/fortune | ${pkgs.cowsay}/bin/cowsay
    #     # ${pkgs.fastfetch}/bin/fastfetch
    #   }

    #   $env.NU_EXISTING_INSTANCE = false

    #   mkdir ($nu.data-dir | path join "vendor/autoload")
    #   ${pkgs.starship}/bin/starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
    # '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "always";
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    options = [ "--cmd cd" ];
  };

  home.file.".hushlogin".text = "";
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
    settings = {
      character = {
        # 󱞪 (for later copying)
        error_symbol = "[ 󱞪 :](bold red)";
        success_symbol = "[ 󱞪 :](bold green)";
        vimcmd_replace_one_symbol = "[<](bold purple)";
        vimcmd_replace_symbol = "[<](bold purple)";
        vimcmd_symbol = "[<](bold green)";
        vimcmd_visual_symbol = "[<](bold yellow)";
      };
      continuation_prompt = "[.](bright-black) ";
      format = "$directory$git_branch$git_status$bun$deno$rust$golang$haskell$haxe$zig$c$cpp$cmake$swift$dotnet$nix_shell$time\n$character";
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
      git_branch = {
        symbol = "git ";
        truncation_symbol = "...";
      };
      git_commit.tag_symbol = " tag ";
      git_status = {
        ahead = ">";
        behind = "<";
        deleted = "x";
        diverged = "<>";
        renamed = "r";
      };
      haskell.symbol = "haskell ";
      haxe.symbol = "haxe ";
      nix_shell.symbol = "nix ";
      package.symbol = "pkg ";
      rust.symbol = "rust ";
      swift.symbol = "swift ";
      zig.symbol = "zig ";
    };
  };
}
