{pkgs, ...}: {
  home.packages = with pkgs; [
    adw-gtk3
    adwaita-icon-theme
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Adwaita";
    };
  };
}
