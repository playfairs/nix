{
  lib,
  darwin,
  ...
}:
lib.optionalAttrs darwin {
  stylix.targets.alacritty.enable = false;

  programs.alacritty = {
    enable = true;
    theme = "rose_pine";

    settings = {
      keyboard.bindings = [
        {
          key = "+";
          mods = "Shift|Control";
          action = "IncreaseFontSize";
        }
        {
          key = "_";
          mods = "Shift|Control";
          action = "DecreaseFontSize";
        }
      ];
      window = {
        opacity = 0.80;
        decorations = "Buttonless";
        padding = {
          x = 10;
          y = 10;
        };
      };
      colors.cursor = {
        text = "#000000";
        cursor = "#ffffff";
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        size = 16;
      };
    };
  };
}
