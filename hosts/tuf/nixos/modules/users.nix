{pkgs, ...}: {
  users.users = {
    yujiqo = {
      isNormalUser = true;
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGAXjM2KIOwW/GjvGwMKH/M6clY72yDQB8fmKe9gwwq4 mac"];
      extraGroups = ["networkmanager" "wheel"];
    };
  };
}
