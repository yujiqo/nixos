{ config, pkgs, ... }:

{
  users.users."yujiqo" = {
    isNormalUser = true;
    description = "yujiqo";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
