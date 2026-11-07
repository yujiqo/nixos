{pkgs, ...}: {
  home.packages = with pkgs; [
    obsidian # og note taking app
    kitty # terminal emulator
    firefox # main web browser
    google-chrome # whenever i need chromium based stuff
    telegram-desktop # messanger
    obs-studio # screen recordings and streaming app
    steam # games
    modrinth-app # minecraft modding launcher
  ];
}
