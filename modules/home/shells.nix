{
  pkgs,
  darwin,
  lib,
  flakeConfig,
  ...
}:
let
  inherit (flakeConfig) user;

  commonAliases = {
    ":q"        = "exit";
    "fuckoff"   = "exit";
    ".."        = "cd ..";
    "-"         = "cd -";
    "l"         = "ls -l";
    "la"        = "ls -la";
    "lks"       = "ls";
    "please"    = "sudo";
    "fuck"      = "touch";
    "copy"      = "cp";
    "nv"        = "nvim";
    "nvm"       = "nvim";
    "neovim"    = "nvim";
    "vimproved" = "vim";
    "hmm"       = "echo 'bros unsure'";
    "ff"        = "fastfetch";
    "urban"     = "urban-cli -m 1";
    "py"        = "python3";
    "lazy"      = "lazygit";
    "azy"       = "lazygit";
    "laz"       = "lazygit";
  };

  darwinAliases = lib.optionalAttrs darwin {
    "hm"        = "nh home switch -c macmini";
    "hm,"       = "nh home switch -c macmini"; # Somehow I manage to type 'hm,' more often than not
    "mh"        = "nh home switch -c macmini"; # Also manage to type this occasionally
    "skip"      = "osascript -e 'tell app \"Spotify\" to next track'";
    "prev"      = "osascript -e 'tell app \"Spotify\" to previous track'";
    "np"        = "osascript -e 'tell application \"Spotify\" to get artist of current track & \" - \" & name of current track & \" (\" & album of current track & \")\"'";
    "savetrack" = "osascript -e 'tell application \"Spotify\" to activate' -e 'tell application \"System Events\" to keystroke \"l\" using {command down, shift down}'";
    "loop"      = "osascript -e 'tell application \"Spotify\" to set repeating to true'";
    "lsblk"     = "diskutil list";
    "vsc"       = "'/Volumes/BARRACUDA/Applications/Visual Studio Code.app/Contents/MacOS/Code'";
  };

  posixAliases = {
    "ani"      = "ani-cli --dub";
    "anid"     = "ani-cli -d -q 1440p --dub -e 1-999";
    "edit"     = "hx";
    "boo"      = "ghostty +boo";
  };

in
{
  imports = [
    ./elvish.nix
    ./starship.nix
  ];

  home.sessionVariables = {
    # EDITOR = "${pkgs.helix}/bin/hx";
    # VISUAL = "${pkgs.helix}/bin/hx";

    NH_FLAKE = "$HOME/.nix";
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

      if [ -n "$SSH_CONNECTION" ]; then
        ( ~/.ssh-monitor/ssh-alert.sh >/dev/null 2>&1 & )
      fi

    '';

    # Throwing this out of initContent because putting comments inside it makes it slower since it still tries to run stuff
    # fastfetch --logo none
    # fastfetch --logo none | lolcat -a -d 8 -s 1000 -t
    # echo "hi ${user.username}, the current time is `date +'%I:%M:%S %p'`"

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    shellAliases = commonAliases // posixAliases // darwinAliases;
  };

  # programs.bash = {
  #   enable = true;
  #   shellAliases = commonAliases // posixAliases // darwinAliases;
  # };

  programs.nushell = {
    enable = true;
    package = pkgs.nushell;

    settings = {
      show_banner = false;
      use_kitty_protocol = true;
      buffer_editor = "hx";

      completions.external = {
        enable = true;
        max_results = 10000;
      };
    };

    # posixAliases intentionally excluded; nushell has different syntax
    shellAliases = commonAliases // darwinAliases;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
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
  my.starship.style = "tokyo_night";
}
