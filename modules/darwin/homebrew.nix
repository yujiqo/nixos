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
      "keka"
      "audacity"
      "mos"
      "quicklook-video"
    ];
  };
}
