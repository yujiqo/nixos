{...}: {
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      flake-registry = "";
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    channel.enable = false;
  };

  programs.nix-ld.enable = true;

  system.stateVersion = "26.05";
}
