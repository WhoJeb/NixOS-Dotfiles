{ config, userSettings, ... }:
{
  hardware.nvidia = {
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    powerManagement.enable = true;
    # prime.offload = {
    #   enable = true;
    #   enableOffloadCmd = true;
    # };
    #  sync.enable = true;
    # prime = {
    #   # Intergraged
    #   intelBusId = "PCI:00:02:0";

    #   # Dedicated
    #   nvidiaBusId = "PCI:01:00:0";
    # };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home"+("/"+userSettings.username)+"/.steam/root/compatibilitytools.d";
  };
}
