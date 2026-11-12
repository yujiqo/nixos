{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports =
    [
      ./hardware-configuration.nix

      ./modules/hardware.nix
      ./modules/users.nix
      ./modules/network.nix

      inputs.home-manager.nixosModules.home-manager
      inputs.yurice.nixosModules.default
    ]
    ++ lib.attrValues inputs.self.nixosModules;

  programs.yurice = {
    enable = true;
    greeter.enable = true;
    greeter.niriExtraConfig = ''
      output "eDP-1" {
        scale 1
      }
    '';
  };

  nixpkgs = {
    overlays = [
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      yujiqo = import ../home-manager/home.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    busybox
  ];
}
