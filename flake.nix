{
  description = "after some thinking... i have decided to stop thinking.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    ...
  } @ inputs: let
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];

    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};
    nixosModules = import ./modules/nixos;
    darwinModules = import ./modules/darwin;
    homeModules = {
      linux = import ./modules/home-manager/linux;
      darwin = import ./modules/home-manager/darwin;
    };

    nixosConfigurations = {
      tuf = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/tuf/nixos/configuration.nix
        ];
      };
    };

    darwinConfigurations = {
      macbook = nix-darwin.lib.darwinSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/macbook/darwin/configuration.nix
        ];
      };
    };
  };
}
