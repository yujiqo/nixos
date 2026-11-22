{config, ...}: {
  networking = {
    hostName = "thinkpad";

    nftables.enable = true;
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };

    firewall = {
      enable = true;

      checkReversePath = "loose";
      trustedInterfaces = [config.services.tailscale.interfaceName];
      allowedUDPPorts = [config.services.tailscale.port];
    };
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSSEC = "allow-downgrade";
      fallbackDns = ["1.1.1.1" "8.8.8.8"];
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

  systemd.services.tailscaled.serviceConfig.Environment = ["TS_DEBUG_FIREWALL_MODE=nftables"];
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;

  programs.amnezia-vpn.enable = true;
}
