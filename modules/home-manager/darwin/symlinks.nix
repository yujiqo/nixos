{
  config,
  pkgs,
  ...
}: let
  dotfiles = "${config.home.homeDirectory}/.nixos/dotfiles/config";
in {
  xdg.configFile."kitty/kitty.local.conf".text = ''
    shell ${pkgs.fish}/bin/fish
    env XDG_CONFIG_HOME=/Users/yujiqo/.config
  '';

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
  xdg.configFile."karabiner/karabiner.json" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/karabiner/karabiner.json";
    force = true;
  };
  home.file.".claude/settings.json" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/settings.json";
    force = true;
  };
}
