{pkgs, ...}: {
  home.packages = with pkgs; [
    # cli utils
    eza # better ls
    bat # better cat
    btop # better top
    duf # storage checker
    fzf # search stuff
    ripgrep # search stuff
    fd # search stuff
    autossh # run ssh tunnels
    unzip # unzip zip files
    starship # fish prompt stylizer
    fastfetch # cool stats about system

    # fonts
    nerd-fonts.comic-shanns-mono # comic sans mono

    # og coding tooling
    git # og version control
    neovim # og text editor
    tmux # og terminal multiplexer

    # programming languages
    rustup # rust
    gcc # c/c++
    nodejs # javascript
    python3 # python
    postgresql # sql db

    # lsp servers, formatters, linters
    efm-langserver # formatter and linter thing for neovim
    selene # lua lint
    stylua # lua fmt
    lua-language-server # lua lsp
    alejandra # nix fmt
    nil # nix lsp
    pyright # python lsp
    svelte-language-server # svelte lsp
    qt6.qtdeclarative # qml lsp
    prettier # markdown fmt (and others)
    marksman # markdown lsp

    # dependencies that don't belong anywhere
    imagemagick # image.nvim dep
    ghostscript # image.nvim dep for pdf files

    # desktop apps
    kitty # terminal emulator
    firefox # web browser
    telegram-desktop # messanger

    # unstable stuff
    unstable.opencode # ai agents
    unstable.tetro-tui # tetris in terminal
  ];
}
