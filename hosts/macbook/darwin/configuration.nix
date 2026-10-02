{
  inputs,
  lib,
  ...
}: {
  imports =
    [
      inputs.home-manager.darwinModules.home-manager
    ]
    ++ lib.attrValues inputs.self.darwinModules;

  nixpkgs = {
    hostPlatform = "aarch64-darwin";

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
}
