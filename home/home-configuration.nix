{ ... }:
{
  home.username = "yujiqo";
  home.homeDirectory = "/home/yujiqo";
  home.stateVersion = "26.05";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/environment.nix
    ./modules/packages.nix

    ./dotfiles/fastfetch.nix
    ./dotfiles/fish.nix
    ./dotfiles/git.nix
    ./dotfiles/kitty.nix
    ./dotfiles/niri.nix
    ./dotfiles/nvim.nix
    ./dotfiles/opencode.nix
    ./dotfiles/tmux.nix
  ];

  programs.home-manager.enable = true;
}
