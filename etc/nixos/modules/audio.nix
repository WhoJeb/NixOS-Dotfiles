{ ... }:

{
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  security.rtkit.enable = true;

  
  # Enable XDG desktop portals for screen sharing/capturing in Wayland
  xdg.portal = {
    enable = true;
    # (Optional) Specify a default backend if you use a specific desktop environment/window manager (e.g., "gnome", "kde", "wlr")
    # For many setups, setting enable = true is enough for auto-detection
    # config = {
    #   common = {
    #     default = "wlr";
    #   };
    # };
  };
}
