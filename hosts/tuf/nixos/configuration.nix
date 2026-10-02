{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports =
    [
      ./hardware-configuration.nix

      inputs.home-manager.nixosModules.home-manager
    ]
    ++ lib.attrValues inputs.self.nixosModules;

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
