{pkgs, ...}: {
  home.packages = with pkgs; [
    adw-gtk3
    adwaita-icon-theme
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      icon-theme = "Adwaita";
    };
  };
}
