{pkgs, ...}: {
  home.packages = with pkgs; [
    # cli utils
    eza # better ls
    btop # better top
    duf # storage checker
    fzf # search stuff
    ripgrep # search stuff
    fd # search stuff
    autossh # run ssh tunnels
    unzip # unzip zip files
    glow # preview md files

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

    # rice related stuff
    quickshell # widget builder
    fastfetch # cool stats about system
    nautilus # file explorer
    fuzzel # temporary app launcher

    # desktop applications
    xwayland-satellite # X11 apps on wayland
    kitty # terminal emulator
    firefox # web browser
    telegram-desktop # messanger
    steam # games
    modrinth-app # minecraft modding launcher

    # unstable stuff
    unstable.opencode # ai agents
    unstable.tetro-tui # tetris in terminal
  ];
}
