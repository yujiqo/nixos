{pkgs, ...}: {
  home.packages = with pkgs; [
    quickemu # lightweight virtual machines
  ];
}
