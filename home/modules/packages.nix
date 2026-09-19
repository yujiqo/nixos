{ pkgs, pkgs-unstable, ... }:
{
  home.packages = [
    pkgs.neovim
    pkgs.tmux
    pkgs.fastfetch
    pkgs.fuzzel
    pkgs.wl-clipboard
    pkgs.cowsay
    pkgs.fortune
    pkgs.gcc
    pkgs.ripgrep
    pkgs.fd
    pkgs.nodejs
    pkgs.unzip
    pkgs-unstable.opencode

    pkgs.brave
    pkgs.kitty
    pkgs.vscodium
    pkgs.obs-studio
    pkgs.discord
    pkgs.telegram-desktop

    pkgs.steam
    pkgs.gamescope
    pkgs.protonup-qt
    pkgs.modrinth-app
  ];
}
