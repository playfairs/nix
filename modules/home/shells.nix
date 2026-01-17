{
  pkgs,
  darwin,
  lib,
  flakeConfig,
  ...
}:
let
  inherit (flakeConfig) user;
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
        vimcmd_replace_one_symbol = "[<](bold purple)";
        vimcmd_replace_symbol = "[<](bold purple)";
        vimcmd_symbol = "[<](bold green)";
        vimcmd_visual_symbol = "[<](bold yellow)";
      };
      continuation_prompt = "[.](bright-black) ";
      format = "$username$directory$git_branch$git_status$bun$deno$rust$golang$haskell$haxe$zig$c$cpp$cmake$swift$dotnet$nix_shell$time\n$character";
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
