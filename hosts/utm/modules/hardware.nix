{ config, lib, pkgs, ... }:

{
  hardware.graphics.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.spice-vdagentd.enable = true;

  environment.systemPackages = with pkgs; [
    mesa-demos
    vulkan-tools
  ];

  environment.sessionVariables = {
    MESA_GL_VERSION_OVERRIDE = "3.3FC";
    MESA_GLSL_VERSION_OVERRIDE = "330";
  };
}
