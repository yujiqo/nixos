{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    fastfetch
    neovim
    kitty
    brave
    fuzzel

    unstable.opencode
  ];
}
