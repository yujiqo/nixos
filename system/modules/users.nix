{ config, pkgs, ... }:

{
  users.users."yujiqo" = {
    isNormalUser = true;
    description = "Main user account";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
