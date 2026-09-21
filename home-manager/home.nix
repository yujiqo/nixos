{
  inputs,
  lib,
  ...
}: {
  imports = lib.attrValues inputs.self.homeModules;

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

  home = {
    username = "yujiqo";
    homeDirectory = "/home/yujiqo";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
