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
      "karabiner-elements"
      "helium-browser"
      "keka"
      "blender"
      "audacity"
      "gimp"
      "mos"
      "quicklook-video"
    ];
  };
}
