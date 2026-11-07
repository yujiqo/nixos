{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # script coverage: latin/cyrillic/greek, cjk, emoji
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji

    # microsoft fonts
    corefonts # times new roman, arial, courier new, georgia, verdana, trebuchet, comic sans, impact, webdings
    vista-fonts # calibri, cambria, candara, consolas, constantia, corbel (office 2007-2019 defaults)

    # metric-compatible fallbacks
    liberation_ttf
    carlito # calibri replacement
    caladea # cambria replacement
  ];
}
