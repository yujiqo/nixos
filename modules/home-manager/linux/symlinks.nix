{config, ...}: let
  yurice = "${config.home.homeDirectory}/.nixos/yurice/config";
  dotfiles = "${config.home.homeDirectory}/.nixos/dotfiles/config";
in {
  xdg.configFile."yurice/custom" = {
    source = config.lib.file.mkOutOfStoreSymlink "${yurice}/custom";
    force = true;
  };

  xdg.configFile."git" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/git";
    force = true;
    recursive = true;
  };
  xdg.configFile."opencode" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/opencode";
    force = true;
    recursive = true;
  };
  home.file.".claude/settings.json" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/settings.json";
    force = true;
  };
}
