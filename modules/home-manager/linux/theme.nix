{pkgs, ...}: let
  # no minimize/maximize/close buttons on either side of the title bar
  noTitlebarButtons = ''
    [Settings]
    gtk-decoration-layout=:
  '';
in {
  home.packages = with pkgs; [
    adw-gtk3
    adwaita-icon-theme
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      icon-theme = "Adwaita";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":";
    };
  };

  # fallback for apps that can't read the dconf value (unwrapped or x11 apps)
  xdg.configFile."gtk-3.0/settings.ini".text = noTitlebarButtons;
  xdg.configFile."gtk-4.0/settings.ini".text = noTitlebarButtons;
}
