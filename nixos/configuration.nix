{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs = {
    overlays = [
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      flake-registry = "";
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    channel.enable = false;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      yujiqo = import ../home-manager/home.nix;
    };
  };

  networking = {
    hostName = "tuf";

    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };
  };

  users.users = {
    yujiqo = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [];
      extraGroups = ["networkmanager" "wheel"];
    };
  };

  programs.niri.enable = true;

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    blueman.enable = true;

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };

    xserver = {
      videoDrivers = ["nvidia"];

      xkb = {
        layout = "us,ru";
        variant = "";
        options = "caps:swapescape,grp:win_space_toggle";
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

    fwupd.enable = true;

    power-profiles-daemon.enable = true;

    thermald.enable = true;
  };

  powerManagement.enable = true;

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
        enable = true;
        configurationLimit = 10;
      };

      efi.canTouchEfiVariables = true;
      timeout = 5;
    };

    #kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.linuxPackages;
  };

  time.timeZone = "Asia/Almaty";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  console.useXkbConfig = true;

  environment.systemPackages = with pkgs; [
    busybox
  ];

  system.stateVersion = "26.05";
}
