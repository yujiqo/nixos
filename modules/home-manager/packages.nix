{pkgs, ...}: {
  home.packages = with pkgs; [
    git

    fastfetch

    eza
    btop
    duf
    fzf
    ripgrep
    fd

    neovim

    fuzzel

    kitty
    brave

    unstable.opencode
  ];
}
