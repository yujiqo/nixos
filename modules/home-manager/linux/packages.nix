{pkgs, ...}: {
  home.packages = with pkgs; [
    # useful utils
    eza
    btop
    duf
    fzf
    ripgrep
    fd
    autossh
    fastfetch
    unzip

    # fonts
    nerd-fonts.comic-shanns-mono

    # og coding tooling
    git
    neovim
    tmux

    # tools needed for coding
    rustup
    gcc
    nodejs
    python3

    # rice related
    fuzzel

    # desktop apps
    kitty
    firefox
    telegram-desktop

    # unstable stuff
    unstable.opencode
    unstable.tetro-tui
  ];
}
