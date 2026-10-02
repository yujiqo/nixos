{...}: {
  networking.hostName = "macbook";

  services.tailscale.enable = true;

  services.openssh = {
    enable = true;
    extraConfig = ''
      PermitRootLogin no
      PasswordAuthentication no
    '';
  };
}
