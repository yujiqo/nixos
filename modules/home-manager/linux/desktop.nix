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

  # quicklook-like previewer for nautilus
  # and extra codecs (h264/hevc) for sushi video previews
  dbus.packages = [pkgs.sushi];
  systemd.user.sessionVariables.GST_PLUGIN_SYSTEM_PATH_1_0 = "${pkgs.gst_all_1.gst-libav}/lib/gstreamer-1.0";
}
