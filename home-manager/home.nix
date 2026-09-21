{ inputs, lib, config, pkgs, ... }: {
  imports = [
  ];

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

    packages = [
      pkgs.neovim
      pkgs.kitty
      pkgs.brave
      pkgs.fuzzel
    ];
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;

  home.stateVersion = "26.05";
}
