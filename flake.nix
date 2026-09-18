{
  description = "yujiqo's nixos flake.";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      systems = {
        thinkpad = "x86_64-linux";
        tuf = "x86_64-linux";
        utm = "aarch64-linux";
      };

      homes = {
        yujiqo = "x86_64-linux";
        utm = "aarch64-linux";
      };

      forSystems = f: nixpkgs.lib.genAttrs (nixpkgs.lib.attrNames systems) (name: f systems.${name});
      pkgsFor = system: nixpkgs.legacyPackages.${system};
      pkgsUnstableFor = system: nixpkgs-unstable.legacyPackages.${system};
    in {
    nixosConfigurations = {
      thinkpad = nixpkgs.lib.nixosSystem {
        system = systems.thinkpad;
        modules = [ ./hosts/thinkpad/system-configuration.nix ];
      };
      tuf = nixpkgs.lib.nixosSystem {
        system = systems.tuf;
        modules = [ ./hosts/tuf/system-configuration.nix ];
      };
      utm = nixpkgs.lib.nixosSystem {
        system = systems.utm;
        modules = [ ./hosts/utm/system-configuration.nix ];
      };
    };
    homeConfigurations = {
      yujiqo = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsFor homes.yujiqo;
        modules = [ ./home/home-configuration.nix ];
        extraSpecialArgs = { pkgs-unstable = pkgsUnstableFor homes.yujiqo; };
      };
      utm = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsFor homes.utm;
        modules = [ ./home/home-configuration.nix { yujiqo.swapCapsEscape = false; } ];
        extraSpecialArgs = { pkgs-unstable = pkgsUnstableFor homes.utm; };
      };
    };
  };
}
