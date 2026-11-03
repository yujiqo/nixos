{pkgs, ...}: {
  home.packages = with pkgs; [
    kitty # terminal emulator
    firefox # main web browser
    chromium # whenever i need chromium based stuff web browser
    telegram-desktop # messanger
    obs-studio # screen recordings and streaming app
    steam # games
    modrinth-app # minecraft modding launcher
  ];
}
