{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    obs-studio
    pipewire
    # pipewirePackages.full # includes all PipeWire utilities
    xdg-desktop-portal # Provides screen capture interface
    xdg-desktop-portal-wlr      # for sway/wayland
    xdg-desktop-portal-gnome
    # wl-screenrec
    obs-studio-plugins.wlrobs

    kdePackages.kdenlive

    wf-recorder

    libsForQt5.qt5ct
  ];
}
