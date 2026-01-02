{
  spicetify-nix,
  pkgs,
  ...
}:
let
  spice-pkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  stylix.targets = {
    spotify-player.enable = false;
    spicetify.enable = false;
  };
  programs = {

    spicetify = {
      # enable = true;

      # theme = spice-pkgs.themes.sleek;
      # colorScheme = "RosePine";
      enabledExtensions = with spice-pkgs.extensions; [
        beautifulLyrics        
      ];
    };
    spotify-player = {
      enable = true;

      settings = {
        theme = "rose-pine";
        notify_format = {
          summary = "{track}";
          body = "{artists} - {album}";
        };
        playback_refresh_duration_in_ms = 500;

        device = {
          volume = 40;
          bitrate = 320;
        };
        layout = {
          playback_window_position = "Bottom";
          library = {
            playlist_percent = 60;
            album_percent = 20;
          };
        };
      };

      themes = [
        {
          name = "rose-pine";

          palette = {
            background = "#191724";
            foreground = "#e0def4";
            black = "#21202e";
            blue = "#31748f";
            cyan = "#9ccfd8";
            green = "#9ccfd8";
            magenta = "#c4a7e7";
            red = "#eb6f92";
            white = "#e0def4";
            yellow = "#f6c177";
            bright_black = "#1e1e2e";
            bright_blue = "#89b4fa";
            bright_cyan = "#89dceb";
            bright_green = "#a6e3a1";
            bright_magenta = "#cba6f7";
            bright_red = "#f38ba8";
            bright_white = "#cdd6f4";
            bright_yellow = "#f9e2af";
          };

          component_style = {
            selection = {
              bg = "#403d52";
              modifiers = [ "Bold" ];
            };
            block_title.fg = "Magenta";
            playback_track = {
              fg = "#ebbcba";
              modifiers = [ "Bold" ];
            };
            playback_album.fg = "Yellow";
            playback_metadata.fg = "Blue";
            playback_progress_bar = {
              bg = "#1f1d2e";
              fg = "#c4a7e7";
            };
            current_playing = {
              fg = "#ebbcba";
              modifiers = [ "Bold" ];
            };
            page_desc = {
              fg = "#ebbcba";
              modifiers = [ "Bold" ];
            };
            table_header.fg = "Blue";
            border = { };
            playback_status = {
              fg = "#ebbcba";
              modifiers = [ "Bold" ];
            };
            playback_artists = {
              fg = "#ebbcba";
              modifiers = [ "Bold" ];
            };
            playlist_desc.fg = "Cyan";
          };
        }
      ];
    };
  };
}
