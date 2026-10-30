{pkgs, ...}: {
  hardware = {
    cpu.intel.updateMicrocode = true;

    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
      ];
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General = {
        Experimental = true;
      };
    };
  };

  services = {
    fwupd.enable = true;

    blueman.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    libinput = {
      enable = true;
      touchpad = {
        tapping = true;
        naturalScrolling = true;
        scrollMethod = "twofinger";
      };
    };

    xserver = {
      videoDrivers = ["modesetting"];

      xkb = {
        layout = "us,ru";
        variant = "";
        options = "caps:swapescape,grp:alt_shift_toggle";
      };
    };

    thermald.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;

    udev.extraRules = ''
      SUBSYSTEM=="power_supply", KERNEL=="BAT0", ENV{CHARGE_LIMIT}="85,90"
    '';
  };

  console.useXkbConfig = true;

  powerManagement.enable = true;
}
