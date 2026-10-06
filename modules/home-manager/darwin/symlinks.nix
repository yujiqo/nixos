{
  config,
  pkgs,
  ...
}: let
  yurice = "${config.home.homeDirectory}/.nixos/yurice/config";
  dotfiles = "${config.home.homeDirectory}/.nixos/dotfiles/config";
in {
  xdg.configFile."fastfetch" = {
    source = config.lib.file.mkOutOfStoreSymlink "${yurice}/fastfetch";
    force = true;
    recursive = true;
  };
  xdg.configFile."kitty/current-theme.conf".source = config.lib.file.mkOutOfStoreSymlink "${yurice}/kitty/current-theme.conf";
  xdg.configFile."kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink "${yurice}/kitty/kitty.conf";
  xdg.configFile."kitty/kitty.local.conf".text = ''
    shell ${pkgs.fish}/bin/fish
    env XDG_CONFIG_HOME=/Users/yujiqo/.config
  '';
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
  xdg.configFile."karabiner/karabiner.json" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/karabiner/karabiner.json";
    force = true;
  };
}
