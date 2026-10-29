{pkgs, ...}: {
  home.packages = with pkgs; [
    starship # fish prompt stylizer
  ];
}
