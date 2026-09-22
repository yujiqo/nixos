{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    neovim
    kitty
    brave
    fuzzel

    unstable.opencode
  ];
}
