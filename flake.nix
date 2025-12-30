{
  nixConfig.extra-experimental-features = [ "pipe-operators" ];

  inputs = {
    self.submodules = true;
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    stylix.url = "github:danth/stylix";
    zen-browser.url = "gitlab:invra/zen-flake";
    ip.url = "gitlab:hiten-tandon/some-nix-darwin-packages";
    ghostty.url = "github:ghostty-org/ghostty";
    discord-rpc-lsp.url = "gitlab:invra/discord-rpc-lsp";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    sketchierbar.url = "gitlab:invra/sketchierbar";
    ffm.url = "gitlab:invra/ffm";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager/a53af7f1514ef4cce8620a9d6a50f238cdedec8b";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nixcord = {
      url = "github:FlameFlag/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    configs.url = ./configs;
  };

  outputs =
    {
      flake-utils,
      nixpkgs,
      configs,
      ...
    }@flakeInputs:
    let
      inherit (nixpkgs) lib;
      mkConfig =
        name: flakeConfig:
        let
          system =
            if lib.strings.hasSuffix "x86" name then
              "x86_64-linux"
            else if lib.strings.hasSuffix "aarch64" name then
              "aarch64-linux"
            else
              "aarch64-darwin";
          pkgs = import nixpkgs { inherit system; };
          custils = import ./utils {
            inherit (nixpkgs) lib;
            inherit pkgs flakeInputs flakeConfig;
            configName = name;
          };
        in
        with custils.builders;
        {
          homeConfigurations.${name} = mkHomeConfig system;
        }
        // (lib.optionalAttrs (lib.strings.hasSuffix "linux" system) {
          nixosConfigurations.${name} = mkNixConfig system;
        })
        // (lib.optionalAttrs (lib.strings.hasSuffix "darwin" system) {
          darwinConfigurations.${name} = mkDarwinConfig system;
        });
      mkConfigs =
        configs:
        builtins.foldl' lib.attrsets.recursiveUpdate { } (
          builtins.attrValues (lib.mapAttrs mkConfig configs)
        );
    in
    (mkConfigs configs)
    // (flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        custils = import ./utils {
          inherit (nixpkgs) lib;
          inherit pkgs flakeInputs;
          flakeConfig = { };
          configName = "devshell";
        };
      in
      {
        formatter = custils.development.formatter;
        devShells.default = custils.development.devShell;
      }
    ));
}
