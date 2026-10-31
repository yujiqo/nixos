{pkgs, ...}: {
  home.packages = with pkgs; [
    kitty # terminal emulator
    firefox # web browser
    firefoxpwa
    telegram-desktop # messanger
    obs-studio # screen recordings and streaming app
    steam # games
    modrinth-app # minecraft modding launcher
  ];
}
