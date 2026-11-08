{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  greeterQml = "${inputs.yurice}/config/quickshell/greeter.qml";

  greeterStart = pkgs.writeShellScript "yurice-greeter-start" ''
    if ! ${pkgs.quickshell}/bin/qs -p ${greeterQml}; then
      ${pkgs.kitty}/bin/kitty ${pkgs.greetd}/bin/agreety --cmd niri-session
    fi
    ${pkgs.niri}/bin/niri msg action quit --skip-confirmation
  '';

  greeterNiriConfig = pkgs.writeText "yurice-greeter-niri.kdl" ''
    hotkey-overlay {
      skip-at-startup
    }

    layout {
      background-color "#000000"
    }

    overview {
      backdrop-color "#000000"
    }

    output "eDP-1" {
      scale 1
    }

    cursor {
      xcursor-size 15
    }

    spawn-at-startup "${greeterStart}"

    binds {
      Ctrl+Alt+Delete { quit skip-confirmation=true; }
    }
  '';

  normalUsers = lib.filterAttrs (_: user: user.isNormalUser) config.users.users;
in {
  assertions = [
    {
      assertion = builtins.pathExists greeterQml;
      message = "The yurice flake input has no config/quickshell/greeter.qml. Commit the greeter in the yurice repo, then run `nix flake update yurice`.";
    }
  ];

  programs.fish.enable = true;
  programs.starship.enable = true;

  programs.niri.enable = true;

  services.greetd = {
    enable = true;
    settings.default_session.command = "${pkgs.niri}/bin/niri -c ${greeterNiriConfig}";
  };

  users.users.greeter = {
    home = "/var/lib/yurice/greeter";
    createHome = false;
  };

  systemd.tmpfiles.rules =
    [
      "d /var/lib/yurice 0755 root root -"
      "d /var/lib/yurice/greeter 0755 greeter greeter -"
      "d /var/lib/yurice/users 0755 root root -"
    ]
    ++ lib.mapAttrsToList (name: user: "d /var/lib/yurice/users/${name} 0755 ${name} ${user.group} -") normalUsers;

  fonts.packages = with pkgs; [
    material-symbols
    nerd-fonts.agave
  ];

  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita";
  };
  environment.variables.QT_STYLE_OVERRIDE = lib.mkForce null;

  programs.localsend.enable = true;
}
