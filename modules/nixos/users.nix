{pkgs, ...}: {
  users.users = {
    yujiqo = {
      isNormalUser = true;
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [];
      extraGroups = ["networkmanager" "wheel"];
    };
  };
}
