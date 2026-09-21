{config, ...}: {
  hardware = {
    cpu.intel.updateMicrocode = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      modesetting.enable = true;

      prime = {
        sync.enable = true;

        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };

      powerManagement = {
        enable = false;
        finegrained = false;
      };
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
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
      videoDrivers = ["nvidia"];

      xkb = {
        layout = "us,ru";
        variant = "";
        options = "caps:swapescape,grp:win_space_toggle";
      };
    };

    thermald.enable = true;
    power-profiles-daemon.enable = true;
  };

  console.useXkbConfig = true;

  powerManagement.enable = true;
}
