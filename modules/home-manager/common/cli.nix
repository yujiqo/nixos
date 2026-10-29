{pkgs, ...}: {
  home.packages = with pkgs; [
    eza # better ls
    bat # better cat
    btop # better top
    duf # storage checker
    fzf # search stuff
    ripgrep # search stuff
    fd # search stuff
    autossh # run ssh tunnels
    unzip # unzip zip files
    fastfetch # cool stats about system
    unstable.tetro-tui # tetris in terminal
  ];
}
