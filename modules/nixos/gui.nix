{pkgs, ...}: {
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
    style = "adwaita-dark";
  };

  programs.localsend.enable = true;

  services.geoclue2 = {
    enable = true;
    appConfig.geoclue-where-am-i = {
      isAllowed = true;
      isSystem = true;
    };
  };

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "where-am-i" ''
      exec ${pkgs.geoclue2}/libexec/geoclue-2.0/demos/where-am-i "$@"
    '')
  ];
}
