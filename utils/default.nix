{
  lib,
  pkgs,
  flakeInputs,
  flakeConfig,
  configName,
  ...
}:
let
  getModulesFromDirRec = import ./lib/getModulesFromDirRec.nix { inherit lib; };
  specialArgs = rec {
    inherit (flakeInputs)
      spicetify-nix
      home-manager
      nixpkgs-stable
      plasma-manager
      nixcord
      stylix
      zen-browser
      ;
    inherit flakeConfig;
    extraOverlays = with flakeInputs; [
      discord-rpc-lsp.overlays.default
      sketchierbar.overlays.default
      nix-dev.overlays.default
      ffm.overlays.default
      ip.overlay
   ];
    linux = (lib.strings.hasSuffix "x86" configName || lib.strings.hasSuffix "aarch64" configName);
    darwin = (!linux);
    allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "nvidia-x11"
        "spotify"
        "nvidia-settings"
        "davinci-resolve"
        "steam-unwrapped"
        "steam_osx"
        "steam"
        "bitwig-studio-unwrapped"
        "discord"
        "obsidian"
        "lastfm"
        "shottr"
        "zelda64recomp"
        "windsurf"
      ];
    custils = import ./. {
      inherit
        lib
        pkgs
        flakeInputs
        flakeConfig
        configName
        ;
    };
  };

  mkHomeConfig =
    system:
    flakeInputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import flakeInputs.nixpkgs { inherit system; };
      modules = [
        ../modules/home
        flakeInputs.plasma-manager.homeManagerModules.plasma-manager
        flakeInputs.nixcord.homeModules.nixcord
        flakeInputs.stylix.homeModules.stylix
        flakeInputs.zen-browser.homeModules.beta
        flakeInputs.spicetify-nix.homeManagerModules.spicetify
      ];
      extraSpecialArgs = specialArgs;
    };

  mkDarwinConfig =
    system:
    flakeInputs.darwin.lib.darwinSystem {
      inherit system;
      modules = [
        ../modules/config
        flakeInputs.stylix.darwinModules.stylix
      ];
      specialArgs = specialArgs;
    };

  mkNixConfig =
    system:
    flakeInputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ../modules/config
        flakeInputs.stylix.nixosModules.stylix
        flakeInputs.mango.nixosModules.mango
      ];
      specialArgs = specialArgs;
    };
in
{
  lib = {
    inherit getModulesFromDirRec;
  };

  builders = {
    inherit mkHomeConfig mkDarwinConfig mkNixConfig;
  };

  development = {
    packages = pkgs.callPackage ./dev/packages.nix { };
    devShell = pkgs.callPackage ./dev/devsh.nix { };
    formatter = pkgs.callPackage ./dev/formatter.nix { inherit flakeInputs; };
  };
}
