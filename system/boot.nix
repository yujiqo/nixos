{ config, pkgs, ... }:

{
  boot = {
    initrd = {
      verbose = false;
      compressor = "zstd";
    };

    consoleLogLevel = 3;
    kernelParams = [ 
      "quiet" 
      "loglevel=3" 
      "rd.systemd.show_status=auto" 
      "udev.log_level=3" 
      "boot.shell_on_fail" 
    ];

    loader = {
      systemd-boot = {
        enable = false;
        configurationLimit = 10;
      };

      grub = {
        enable = true;
	device = "nodev";
	efiSupport = true;
	useOSProber = true;
      };

      efi.canTouchEfiVariables = true;
      timeout = 5;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };
}
