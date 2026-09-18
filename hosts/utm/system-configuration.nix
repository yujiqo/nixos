{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../system/boot.nix
      ../../system/desktop.nix
      ../../system/localization.nix
      ../../system/nixos.nix

      ./modules/hardware.nix
      ./modules/network.nix
      ./modules/users.nix
    ];

  services.xserver.xkb.options = lib.mkForce "grp:win_space_toggle";
}
