{pkgs, ...}: {
  home.packages = with pkgs; [
    starship # fish prompt stylizer
    wimlib # for setting up windows iso on mac
  ];
}
