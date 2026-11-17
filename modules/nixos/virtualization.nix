{...}: {
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  programs.virt-manager.enable = true;
  networking.firewall.trustedInterfaces = ["virbr0"];
}
