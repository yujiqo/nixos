{ pkgs, pkgs-unstable, ... }:
{
  home.packages = [
    pkgs.neovim
    pkgs.tmux
    pkgs.fastfetch
    pkgs.brave
    pkgs.kitty
    pkgs.fuzzel
    pkgs.wl-clipboard
    pkgs.cowsay
    pkgs.fortune
    pkgs.gcc
    pkgs.ripgrep
    pkgs.fd
    pkgs.nodejs

    pkgs-unstable.opencode
  ];
}
