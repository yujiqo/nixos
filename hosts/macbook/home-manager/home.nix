{
  inputs,
  lib,
  ...
}: {
  imports = lib.attrValues inputs.self.homeModules.darwin;

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
    homeDirectory = "/Users/yujiqo";
    stateVersion = "26.05";
  };

  programs.man.generateCaches = false;

  programs.home-manager.enable = true;
}
