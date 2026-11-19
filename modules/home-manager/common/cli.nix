{pkgs, ...}: {
  home.packages = with pkgs; [
    duf # storage checker
    autossh # run ssh tunnels
    unzip # unzip zip files
    jq # parse json
    dua # disk usage analyzer
    unstable.tetro-tui # tetris in terminal
  ];
}
