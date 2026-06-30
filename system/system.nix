{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
      ./modules/boot.nix
      ./modules/network.nix
      ./modules/localization.nix
      ./modules/users.nix
      ./modules/nixos.nix
      ./modules/hardware.nix
      ./modules/desktop.nix
    ];
}
