{pkgs, ...}: {
  systemd.settings.Manager.RebootWatchdogSec = "0";

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
      "systemd.show_status=false"
      "udev.log_level=3"
      "boot.shell_on_fail"
      "console=tty12"
      "vt.global_cursor_default=0"
    ];

    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };

      efi.canTouchEfiVariables = true;
      timeout = 5;
    };

    #kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.linuxPackages;
  };
}
