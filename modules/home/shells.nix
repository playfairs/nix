{
  pkgs,
  darwin,
  lib,
  flakeConfig,
  ...
}:
let
  inherit (flakeConfig) user;
  colours = {
    usernameFg = "#ebbcba";
    usernameBg = "#483d47";

    directoryFg = "#c4a7e7";
    directoryBg = "#403850";

    gitFg = "#9ccfd8";
    gitBg = "#286983";
  };

in
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    
    shellAliases = {
      fuckoff = "exit";
      ":q" = "exit";
      l = "ls -l";
      la = "ls -la";
      please = "sudo";
      fuck = "touch";
      nv = "nvim";
      vimproved = "vim";
      hmm = "echo 'bros unsure'";
      ff = "fastfetch";
      copy = "cp";
    } // lib.optionalAttrs darwin {
      hm = "nh home switch -c macmini";
    };
  };

  programs.nushell = {
    enable = true;

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
      la = "ls -la";
      please = "sudo";
      fuck = "touch";
      nv = "nvim";
      vimproved = "vim";
      hmm = "echo 'bros unsure'";
      ff = "fastfetch";
      copy = "cp";
    } // lib.optionalAttrs darwin {
      hm = "nh home switch -c macmini";
    };

    extraConfig = ''
      #!/bin/nu
      $env.LS_COLORS = (${pkgs.vivid}/bin/vivid generate rose-pine)
      $env.EDITOR = "${pkgs.helix}/bin/hx";
      $env.VISUAL = "${pkgs.helix}/bin/hx";
      $env.NH_FLAKE = $"($env.HOME)/.nix";
      $env.NH_OS_FLAKE = $"($env.HOME)/.nix";
      $env.NH_DARWIN_FLAKE = $"($env.HOME)/.nix";
      $env.NH_HOME_FLAKE = $"($env.HOME)/.nix";
      $env.PATH = $env.PATH
      | append [
        "/${if darwin then "Users" else "home"}/${user.username}/.nix-profile/bin"
        "/nix/var/nix/profiles/default/bin"
        "/etc/profiles/per-user/${user.username}/bin"
        "/run/current-system/sw/bin"
      ]

      if not ((("NU_EXISTING_INSTANCE" in $env)) and ($env.NU_EXISTING_INSTANCE == true)) {
        sleep 50ms
        ${pkgs.fastfetch}/bin/fastfetch
      }

      $env.NU_EXISTING_INSTANCE = false

      mkdir ($nu.data-dir | path join "vendor/autoload")
      ${pkgs.starship}/bin/starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
    '';
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
        [](fg:${colours.usernameBg})[ 󱄅  ](bg:${colours.usernameBg} fg:${colours.usernameFg})$username[](bg:${colours.directoryBg} fg:${colours.usernameBg})$directory[](fg:${colours.directoryBg} bg:${colours.gitBg})$git_branch$git_status[](fg:${colours.gitBg} bg:#26233a)$nodejs$rust$golang$php[](fg:#26233a bg:#2a273f)$time[](fg:#2a273f)
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