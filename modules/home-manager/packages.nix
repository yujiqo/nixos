{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    fastfetch
    autossh

    eza
    btop
    duf
    fzf
    ripgrep
    fd

    nerd-fonts.comic-shanns-mono

    neovim

    fuzzel

    kitty
    firefox

    unstable.opencode
  ];
}
