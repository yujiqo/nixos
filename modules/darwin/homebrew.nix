{...}: {
  homebrew = {
    enable = true;

    global = {
      brewfile = true;
    };

    onActivation = {
      autoUpdate = true;
      upgrade = true;

      cleanup = "uninstall";
    };

    taps = [
      "gromgit/fuse"
      "anomalyco/tap"
    ];

    casks = [
      "obs"
      "kitty"
      "firefox"
      "google-chrome"
      "telegram-desktop"
      "karabiner-elements"
      "keka"
      "blender"
      "audacity"
      "gimp"
      "mos"
      "quicklook-video"
      "bitwarden"
    ];
  };
}
