{
  programs.vscode = {
    enable = true;

    profiles.default.userSettings = {
      "workbench.colorCustomizations" = {
        "terminal.background" = "#00000000";
      };

      "workbench.settings.applyToAllProfiles" = [
        "workbench.colorCustomizations"
      ];

      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;

      "chat.viewSessions.orientation" = "stacked";

      "github.copilot.nextEditSuggestions.enabled" = false;
      "github.copilot.chat.localeOverride" = "en";
      "github.copilot.enable" = {
        "*" = false;
        plaintext = false;
        markdown = false;
        scminput = false;
        c = false;
      };

      "workbench.colorTheme" = "Rosé Pine Moon";
      "background.enabled" = false;
      "files.autoSave" = "afterDelay";

      "background.fullscreen" = {
        images = [
          "https://assets.asteride.dev/femware.png"
        ];
        opacity = 1;
        size = "cover";
        position = "center";
        interval = 0;
        random = false;
      };

      "codeium.enableCodeLens" = false;
      "workbench.iconTheme" = "material-icon-theme";

      "chat.tools.urls.autoApprove" = {
        "https://code.visualstudio.com" = true;
        "https://github.com/microsoft/vscode/wiki/*" = true;
        "https://www.bing.com/search" = true;
        "https://www.bing.com" = true;
        "https://*.bing.com" = true;

        "https://raw.githubusercontent.com/playfairs/nox/refs/heads/master/docs/nox-build.md" = {
          approveRequest = false;
          approveResponse = true;
        };

        "https://github.com/playfairs/nox" = {
          approveRequest = false;
          approveResponse = true;
        };
      };

      "vscord.app.name" = "Visual Studio Code";
      "vscord.status.idle.timeout" = 0;
      "vscord.status.idle.enabled" = false;
      "vscord.status.idle.check" = false;
      "vscord.status.problems.enabled" = false;

      "vscord.status.state.text.viewing" =
        "Editing {file_name}{file_extension}";

      "vscord.status.state.text.editing" =
        "Editing {folder_and_file}:{current_line}:{current_column}";

      "vscord.status.image.large.viewing.text" =
        "Editing a {LANG} file";

      "workbench.startupEditor" = "none";
      "editor.accessibilitySupport" = "off";

      "background.editor" = {
        useFront = true;

        style = {
          "background-position" = "100% 100%";
          "background-size" = "auto";
          opacity = 0.6;
        };

        styles = [ ];
        images = [ ];
        interval = 0;
        random = false;
      };

      "Q#.notifications.suppressUpdateNotifications" = true;

      "mesonbuild.downloadLanguageServer" = true;
      "mesonbuild.modifySettings" = false;

      "material-icon-theme.files.associations" = {
        "nox.build" = "../../icons/N";
        noxfile = "../../icons/N";
        "nox.config" = "../../icons/N";
      };

      "files.associations" = {
        ".haskell-format" = "markdown";
        "*.hs" = "haskell";
      };
    };
  };
}

