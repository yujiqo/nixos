{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    fastfetch
    autossh
    unzip

    eza
    btop
    duf
    fzf
    ripgrep
    fd

    nerd-fonts.comic-shanns-mono

    neovim
    tree-sitter
    gcc
    python3
    rustup
    nodejs

    fuzzel

    kitty
    firefox

    unstable.opencode
  ];
}
