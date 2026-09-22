{config, ...}: let
  dotfiles = "${config.home.homeDirectory}/.nixos/dotfiles";
in {
  xdg.configFile."git/config".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/git/config";
  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/niri";
  xdg.configFile."fastfetch".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/fastfetch";
  xdg.configFile."kitty".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/kitty";
  xdg.configFile."fish".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/fish";
  xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/starship/starship.toml";
}
