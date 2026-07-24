{
  pkgs,
  ...
}:
{
  stylix.targets.helix.enable = false;

  programs.helix = {
    enable = true;
    defaultEditor = true;

    languages = {
      language-server.discord-rpc.command = "discord-rpc-lsp";

      language = [
        {
          language-servers = [
            "discord-rpc"
            "rust-analyzer"
          ];
          name = "rust";
          indent = {
            tab-width = 2;
            unit = " ";
          };
        }
        {
          language-servers = [
            "discord-rpc"
            "nixd"
            "nil"
          ];
          name = "nix";
        }
        {
          language-servers = [
            "discord-rpc"
            "zls"
          ];
          name = "zig";
        }
        {
          language-servers = [
            "discord-rpc"
            "typescript-langague-server"
          ];
          name = "typescript";
        }
        {
          language-servers = [
            "discord-rpc"
            "gopls"
          ];
          name = "go";
        }
      ];
    };

    settings = {
      theme = "nyxvamp-veil";

      editor = {
        path-completion = true;
        line-number = "absolute";
        continue-comments = true;
        auto-completion = true;
        color-modes = true;
        bufferline = "multiple";
        scrolloff = 100;
        mouse = false;
        popup-border = "all";
        end-of-line-diagnostics = "hint";
        cursor-shape.insert = "bar";
        inline-diagnostics.cursor-line = "warning";
        insert-final-newline = false;
        statusline = {
          left = [
            "mode"
            "file-modification-indicator"
            "spinner"
          ];
          center = [ "file-absolute-path" ];
          right = [
            "diagnostics"
            "file-type"
            "file-encoding"
            "file-line-ending"
          ];
        };
        lsp = {
          display-inlay-hints = true;
          display-progress-messages = true;
        };
        indent-guides = {
          render = true;
          character = "|";
          skip-levels = 1;
        };
      };
      keys = {
        normal = {
          A-r = ":config-reload";
          y = ":clipboard-yank";
          space = {
            space = "@<space>f";
            w = ":w!";
            W = ":wq!";
            q = ":qa";
            Q = ":qa!";
          };
        };
        select.y = ":clipboard-yank";
      };
    };
    extraPackages = with pkgs; [
      nil
      nixd
      # marksman
      markdownlint-cli2
      bash-language-server
      discord-rpc-lsp
    ];
  };
}
