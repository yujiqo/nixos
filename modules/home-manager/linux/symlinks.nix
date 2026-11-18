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
  home.file.".codex/AGENTS.md" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/codex/AGENTS.md";
    force = true;
  };

  home.file.".codex/rules/default.rules" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/codex/rules/default.rules";
    force = true;
  };

  home.file.".claude/settings.json" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/settings.json";
    force = true;
  };
}
