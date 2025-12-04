{ config, userSettings, pkgs, libs, ... }:
{
  hardware.nvidia = {
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    powerManagement.enable = true;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    prime.offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    prime = {
      sync.enable = false;

      # Intergraged
      intelBusId = "PCI:00:02:0";

      # Dedicated
      nvidiaBusId = "PCI:01:00:0";
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home"+("/"+userSettings.username)+"/.steam/root/compatibilitytools.d";
  };
}
