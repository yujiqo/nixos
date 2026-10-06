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
    glow

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
    nautilus
    fuzzel

    # desktop apps
    xwayland-satellite
    kitty
    firefox
    telegram-desktop
    steam
    modrinth-app

    # unstable stuff
    unstable.opencode
    unstable.tetro-tui
  ];
}
