{config, ...}: 
let
  dotfiles = "${config.home.homeDirectory}/.nixos/dotfiles";
in
{
  xdg.configFile."niri" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/niri";
    force = true;
  };
}
