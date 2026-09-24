{config, ...}: {
  networking = {
    hostName = "tuf";

    nftables.enable = true;
    networkmanager.enable = true;

    firewall = {
      enable = true;

      trustedInterfaces = [ config.services.tailscale.interfaceName ];
      allowedUDPPorts = [ config.services.tailscale.port ];
    };
  };

  services.openssh = {
    enable = true;

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  services.tailscale = {
    enable = true;
  };

  systemd.services.tailscaled.serviceConfig.Environment = [ "TS_DEBUG_FIREWALL_MODE=nftables"];
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;
}
