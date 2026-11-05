{pkgs, ...}: {
  home.packages = with pkgs; [
    nerd-fonts.comic-shanns-mono # comic sans mono
    nerd-fonts.iosevka # iosevka mono
  ];
}
