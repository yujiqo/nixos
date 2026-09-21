{pkgs, ...}: {
  home.packages = with pkgs; [
    neovim
    kitty
    brave
    fuzzel

    unstable.opencode
  ];
}
