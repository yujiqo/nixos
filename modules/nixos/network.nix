{...}: {
  networking = {
    hostName = "tuf";

    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [22];
    };
  };

  services.openssh = {
    enable = true;

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
}
