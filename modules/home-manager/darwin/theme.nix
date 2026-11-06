{
  config,
  pkgs,
  ...
}: let
  home = config.home.homeDirectory;

  yurice-sync = pkgs.writeShellApplication {
    name = "yurice-sync";
    runtimeInputs = [pkgs.matugen];
    text = ''
      state_dir="$HOME/.local/state/yurice"
      state_file="$state_dir/darwin-wallpaper"
      matugen_config="$HOME/.nixos/yurice/config/matugen/config.toml"

      wall="$(/usr/bin/osascript -e 'tell application "System Events" to get picture of current desktop' 2>/dev/null || true)"

      # skip apple dynamic/aerial wallpapers and anything that isn't a real image file
      [ -n "$wall" ] && [ -f "$wall" ] || exit 0
      case "$(printf '%s' "$wall" | tr '[:upper:]' '[:lower:]')" in
        *.jpg | *.jpeg | *.png | *.webp | *.heic) ;;
        *) exit 0 ;;
      esac

      mkdir -p "$state_dir"
      if [ "''${1:-}" != "--force" ] && [ "$(cat "$state_file" 2>/dev/null || true)" = "$wall" ]; then
        exit 0
      fi

      matugen image "$wall" -c "$matugen_config" --source-color-index 0 -q
      printf '%s' "$wall" > "$state_file"
    '';
  };
in {
  home.packages = [
    pkgs.matugen # color generation tool
    yurice-sync # regenerate palette from current wallpaper (--force to ignore cache)
  ];

  launchd.agents.yurice-matugen = {
    enable = true;
    config = {
      ProgramArguments = ["${yurice-sync}/bin/yurice-sync"];
      WatchPaths = ["${home}/Library/Application Support/com.apple.wallpaper/Store/Index.plist"];
      RunAtLoad = true;
      ThrottleInterval = 5;
      EnvironmentVariables.PATH = "/etc/profiles/per-user/${config.home.username}/bin:${home}/.nix-profile/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin";
      StandardOutPath = "${home}/Library/Logs/yurice-matugen.log";
      StandardErrorPath = "${home}/Library/Logs/yurice-matugen.log";
    };
  };
}
