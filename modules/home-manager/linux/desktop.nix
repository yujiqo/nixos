{pkgs, ...}: {
  home.packages = with pkgs; [
    quickshell # widget builder
    fuzzel # temporary app launcher
    nautilus # file explorer
    playerctl # media keys
    brightnessctl # backlight control
    xwayland-satellite # X11 apps on wayland
    bluetuith # tui for bluetooth
  ];
}
