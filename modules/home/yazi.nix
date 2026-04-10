{ pkgs, ... }:

let
  rosePineYazi = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "yazi";
    rev = "c89d745573d4fcfe0550fe6646f9f9ab1c0e51db";
    sha256 = "sha256-9e3dXViWl1rK9BPrGAFfs9ZL/tsG6Njz6ksuU6AIrFY=";
  };
in
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    
    theme.flavor = {
      dark = "rose-pine-moon";
    };

    settings = {
      manager = {
        ratio = [ 1 4 3 ];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
      };

      preview = {
        image_filter = "lanczos3";
        image_quality = 90;
        tab_size = 1;
        max_width = 600;
        max_height = 900;
      };

      tasks = {
        micro_workers = 5;
        macro_workers = 10;
        bizarre_retry = 5;

      };
    };
  };

  xdg.configFile."yazi/flavors/rose-pine-moon.yazi".source =
    "${rosePineYazi}/flavors/rose-pine-moon.yazi";
}