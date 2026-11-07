{pkgs, ...}: {
  home.packages = with pkgs; [
    quickshell # widget builder
    fuzzel # temporary app launcher
    nautilus # file explorer
    playerctl # media keys
    brightnessctl # backlight control
    xwayland-satellite # X11 apps on wayland
    bluetuith # tui for bluetooth
    material-symbols # icon font by google
    nerd-fonts.agave # main system font which is downloaded on all of my machines in "../common/fonts.nix"
    matugen # color generation tool
    wl-clipboard # clipboard cli for the launcher
    libqalculate # qalc for the launcher calculator
    wtype # pastes clipboard history entries
    realesrgan-ncnn-vulkan # wallpaper upscaling
    imagemagick # wallpaper resolutions and resizing
  ];

  # clipboard history for the launcher
  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  # quicklook-like previewer for nautilus
  # and extra codecs (h264/hevc) for sushi video previews
  dbus.packages = [pkgs.sushi];
  systemd.user.sessionVariables.GST_PLUGIN_SYSTEM_PATH_1_0 = "${pkgs.gst_all_1.gst-libav}/lib/gstreamer-1.0";

  # stop blueman's connect/disconnect popups (ConnectionNotifier plugin)
  dconf.settings."org/blueman/general".plugin-list = ["!ConnectionNotifier"];
}
