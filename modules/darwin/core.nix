{...}: {
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      flake-registry = "";
    };

    gc = {
      automatic = true;
      interval = [{Weekday = 7;}];
      options = "--delete-older-than 7d";
    };
  };

  time.timeZone = "Asia/Almaty";

  system.stateVersion = 7;
}
