{ pkgs, userSettings, systemSettings, ... }:
{
  services.syncthing = {
    enable = true; # enable syncthing
    systemService = true; # autostart

    # Run as your user
    user = "${userSettings.username}";

    guiAddress = "127.0.0.1:8384";

    #
    # users.users.${userSettings.username} = {
    #   isNormalUser = true;
    #   home = "/home/${userSettings.username}";
    # };
    
    settings = {
      # Configure Syncthing folders
      folders = {
        "Books" = {
          path = "~/Books";
          id = "gvmoq-nxsp9";
          devices = [
            "CGMWNRH-APYVQFH-5FMHKWK-KEWLI3D-2XXTW55-ZVCP47Y-IYTAPCP-SRR4NQT" # Unraid
            "IKNEMJK-RQ3R6KF-5SDLLLI-MO6EL2F-C2Z2T25-DQ4NTGN-YSUNMP4-I7Y4GQX" # Pixel 8a
          ];
          # Optional confs
          type = "sendreceive";
        };

        "Music" = {
          path = "~/Music";
          id = "96mwt-cxu3t";
          devices = [
            "CGMWNRH-APYVQFH-5FMHKWK-KEWLI3D-2XXTW55-ZVCP47Y-IYTAPCP-SRR4NQT" # Unraid
            "IKNEMJK-RQ3R6KF-5SDLLLI-MO6EL2F-C2Z2T25-DQ4NTGN-YSUNMP4-I7Y4GQX" # Pixel 8a
          ];
          # Optional confs
          type = "sendreceive";
        };

        "Obsidian Vault" = {
          path = "~/Documents/Obsidian Vault";
          id = "OBSIDIAN_VAULT";
          devices = [
            "CGMWNRH-APYVQFH-5FMHKWK-KEWLI3D-2XXTW55-ZVCP47Y-IYTAPCP-SRR4NQT" # Unraid
            "IKNEMJK-RQ3R6KF-5SDLLLI-MO6EL2F-C2Z2T25-DQ4NTGN-YSUNMP4-I7Y4GQX" # Pixel 8a
          ];
          # Optional confs
          type = "sendreceive";
        };
      };

      # Configure Devices
      devices = {
        #   This name here before the "=" is just for the nixos module, hence its value is irrelevant
        unraid = {
          id = "CGMWNRH-APYVQFH-5FMHKWK-KEWLI3D-2XXTW55-ZVCP47Y-IYTAPCP-SRR4NQT";
          name = "Unraid";
          # addresses = ["dynamic"];
          # compression = "metadata";
        };

        pixel8a = {
          id = "IKNEMJK-RQ3R6KF-5SDLLLI-MO6EL2F-C2Z2T25-DQ4NTGN-YSUNMP4-I7Y4GQX";
          name = "Pixel 8a";
          # addresses = ["dynamic"];
          # compression = "metadata";
        };
      };
    };
  };
}
