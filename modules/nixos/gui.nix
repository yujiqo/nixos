{
  lib,
  pkgs,
  ...
}: {
  programs.fish.enable = true;
  programs.starship.enable = true;

  programs.niri.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita";
  };
  environment.variables.QT_STYLE_OVERRIDE = lib.mkForce null;

  programs.localsend.enable = true;
}
