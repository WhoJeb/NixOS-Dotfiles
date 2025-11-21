# Basically the Suzuki GSXR of the linux desktop world
# Wiki: https://nixos.wiki/wiki/Xfce
{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };

  services.displayManager.defaultSession = "xfce";

  environment.systemPackages = with pkgs; [
    # xfce.xfdesktop
    xfce.xfce4-xkb-plugin
    xfce.xfwm4-themes
    xfce.catfish
    xfce.xfwm4
    xfce.xfmpc
    xfce.orage
    xfce.xfburn
    xfce.gigolo
    xfce.garcon
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-volumed-pulse
    xfce.xfce4-taskmanager
    xfce.xfce4-session
    xfce.xfce4-screenshooter
    xfce.xfce4-screensaver
    xfce.xfce4-power-manager
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-notifyd
    xfce.xfce4-icon-theme
    xfce.xfce4-windowck-plugin
    xfce.xfce4-weather-plugin
  ];
}
