{config, ...}: let
  yurice = "${config.home.homeDirectory}/.nixos/yurice/config";
  dotfiles = "${config.home.homeDirectory}/.nixos/dotfiles/config";
in {
#  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink "${yurice}/niri";
#  xdg.configFile."fastfetch".source = config.lib.file.mkOutOfStoreSymlink "${yurice}/fastfetch";
#  xdg.configFile."kitty".source = config.lib.file.mkOutOfStoreSymlink "${yurice}/kitty";
#  xdg.configFile."fish".source = config.lib.file.mkOutOfStoreSymlink "${yurice}/fish";
#  xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${yurice}/starship.toml";
#  xdg.configFile."tmux".source = config.lib.file.mkOutOfStoreSymlink "${yurice}/tmux";
#  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${yurice}/nvim";

#  xdg.configFile."git/config".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/git/config";
#  xdg.configFile."opencode/opencode.jsonc".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/opencode/opencode.jsonc";
  xdg.configFile."niri" = {
    source = config.lib.file.mkOutOfStoreSymlink "${yurice}/niri";
    force = true;
    recursive = true;
  };
  xdg.configFile."fastfetch" = {
    source = config.lib.file.mkOutOfStoreSymlink "${yurice}/fastfetch";
    force = true;
    recursive = true;
  };
  xdg.configFile."kitty" = {
    source = config.lib.file.mkOutOfStoreSymlink "${yurice}/kitty";
    force = true;
    recursive = true;
  };
  xdg.configFile."fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${yurice}/fish";
    force = true;
    recursive = true;
  };
  xdg.configFile."starship.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${yurice}/starship/starship.toml";
    force = true;
  };
  xdg.configFile."tmux" = {
    source = config.lib.file.mkOutOfStoreSymlink "${yurice}/tmux";
    force = true;
    recursive = true;
  };
  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${yurice}/nvim";
    force = true;
    recursive = true;
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
}
