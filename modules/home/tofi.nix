{
  linux,
  lib,
  ...
}:
lib.optionalAttrs linux {
  stylix.targets.tofi.enable = false;

  programs.tofi = {
    enable = true;

    settings = {
      prompt-text = "\"󱞪 \""; # Generator doesnt wrap "" so intentional space is excaped.
      text-color = "#e0def4";
      prompt-color = "#ebbcba";
      selection-color = "#c4a7e7";
      background-color = "#191724e6";

      width = "100%";
      padding-left = "35%";
      padding-top = "30%";
      height = "100%";
      border-width = 0;
      outline-width = 0;
      result-spacing = 14;
      num-results = 8;
      font = "JetBrains Mono Nerd Font";
      font-variations = "wght 600";
      font-size = 26;
    };
  };
}

