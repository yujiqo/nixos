{config, ...}: 
let
  dotfiles = "${config.home.homeDirectory}/.nixos/dotfiles";
in
{
  xdg.configFile."git/config".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/git/config";
  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/niri";
}
