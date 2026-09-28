{ pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = ./anime.txt;
        type = "file";

        color = {
          "1" = "#B4BEFE";
        };

        padding = {
          right = 1;
        };
      };

      display = {
        separator = "  ";

        color = {
          keys = "#B4BEFE";
          output = "#B4BEFE";
          title = "#B4BEFE";
        };

        brightColor = false;

        key = {
          width = 16;
          type = "string";
        };
      };

      modules = [
        {
          type = "os";
          key = "    os:";
        }
        {
          type = "kernel";
          key = "    kernel:";
        }
        {
          type = "wm";
          key = "    wm:";
        }
        {
          type = "shell";
          key = "    shell:";
        }
        {
          type = "terminal";
          key = "    term:";
        }
        {
          type = "cpu";
          key = "    cpu:";
        }
        {
          type = "gpu";
          key = "  󰢮  gpu:";
        }
        {
          type = "memory";
          key = "    mem:";
        }
        {
          type = "packages";
          key = "  󰏓  pkgs:";
        }
        # {
        #   type = "disk";
        #   key = "  󰋊  disk:";
        # }
        {
          type = "display";
          key = "  󰍹  disp:";
        }
        {
          type = "uptime";
          key = "  󱫐  up:";
        }
        {
          type = "board";
          key = "  󰚗  board:";
        }
        {
          type = "bios";
          key = "  󰘚  bios:";
        }
      ];
    };
  };
}