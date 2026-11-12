{
  config,
  inputs,
  lib,
  ...
}: {
  imports =
    lib.attrValues (import ./modules)
    ++ lib.attrValues inputs.self.homeModules.common
    ++ lib.attrValues inputs.self.homeModules.linux
    ++ [inputs.yurice.homeModules.default];

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

  programs.yurice = {
    desktop.enable = true;
    terminal.enable = true;
    configDir = "${config.home.homeDirectory}/.nixos/yurice/config";
  };

  programs.home-manager.enable = true;
}
