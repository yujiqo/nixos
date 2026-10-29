{pkgs, ...}: {
  home.packages = with pkgs; [
    libreoffice # opensorce office
    gimp
  ];
}
