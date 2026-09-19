{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nvim = "nvim -p";
      quote = "fortune | cowsay";
      os-switch="sudo nixos-rebuild switch --flake";
      home-switch="home-manager switch --flake";
    };
    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = "$all$character";
      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
      };
      directory.style = "bold cyan";
      git_branch.style = "bold purple";
      git_status.style = "bold red";
    };
  };
}
