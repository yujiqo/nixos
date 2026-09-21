{...}: {
  users.users = {
    yujiqo = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [];
      extraGroups = ["networkmanager" "wheel"];
    };
  };
}
