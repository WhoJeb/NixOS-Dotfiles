{ config, pkgs, pkgs-unstable, lib, userSettings, systemSettings, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/updates.nix
      ./../../modules/audio.nix
      ./../../modules/niri.nix
      # ./../../modules/nushell.nix
      # ./../../modules/nix-alien.nix
      ./../../modules/locale.nix
      ./../../modules/fonts.nix
      ./../../modules/nvf.nix
      # ./../../modules/vm.nix
      ./../../modules/gaming.nix
      ./../../modules/nvidia.nix
      ./../../modules/systemd-boot.nix
      # ./../../modules/grub.nix
      ./../../modules/fcitx5.nix
      ./../../modules/drawing-tablets.nix
      # ./../../modules/syncthing.nix # Fix error
      # ./../../modules/hyprland.nix
      ./../../modules/hacking.nix
      # ./../../modules/mango.nix
      ./../../modules/programming.nix
      # ./../../modules/video-production.nix
    ];

  networking.hostName = systemSettings.hostname; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;
  services.tailscale.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Temp and Power
  programs.coolercontrol.enable = false;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  
  # Astriks for passwords
  security.sudo.extraConfig = "Defaults pwfeedback";

  # services.flatpak.enable = true;

  # IF MODIFYING also change the kitty config default
  environment.shells = with pkgs; [ zsh bash fish ]; # nushell
  users.defaultUserShell = pkgs.zsh;
  # programs.fish.enable = true;
  # programs.nushell.enable = true;
  programs.zsh.enable = true;
  
  # Docker
  virtualisation.docker.enable = true;

  # Enable for graphics acceleration
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Usb
  services.udisks2.enable = true;

  # Auto-Mount Mobile Device File Systems
  services.gvfs.enable = true;

  # xWayland
  programs.xwayland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Filebroswer Fix
  xdg.portal = { 
    enable = true;
    # wlr.enable = true; # Disable for niri
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
      pkgs.xdg-desktop-portal-gnome 
    ];
  };
  
  # Can remove when niri add proper xdg portal support
  lib.mkForce.environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "GNOME";
  };

  # Enable the X11 windowing system
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    
    xkb = {
      layout = "au,jp";
      variant = ",";
      # options = "grp:alt_shift_toggle";
    };

  };

  services.libinput.touchpad = {
    naturalScrolling = true;
  };
  
  services.displayManager.ly.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    # packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.open-webui.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = (with pkgs; [
    # General
    floorp-bin
    mako
    vlc
    mpd
    # kdePackages.dolphin
    syncthing
    bottles
    qbittorrent
    gnome-multi-writer
    udisks
    udiskie
    dmidecode
    musikcube
    ffmpeg
    onlyoffice-desktopeditors
    filezilla
    localsend
    alsa-tools
    alsa-lib
    blueberry
    foliate
    blanket
    searxng
    xwayland-satellite # IDK if this actually helps but yay its here; ugh fuck bloat, and no its not 5am
    # nautilus # Needed for file browsers in programs running under xwayland; 🥳 I'm so happy this works now!

    nicotine-plus
    soundconverter

    # Anki
    anki

    # Image Manipulation
    gimp2
    krita

    # AI
    # ollama

    # Note Taking
    obsidian

    # Proton
    protonvpn-gui
    proton-pass
    protonmail-desktop
    proton-authenticator

    # Terminal
    kitty
    # alacritty
    fzf
    wget
    btop
    yazi
    cbonsai
    cmatrix
    fastfetch
    unzip
    p7zip
    # peazip
    # rar
    zoxide
    killall
    exiftool
    gdu # Disk/storage Analysis

    # Trial (Delete if don't like or not used)
    # mandelbulber
    # kicad
  ])

  ++ 

  (import ./../../scripts { inherit pkgs; })

  ++

  (with pkgs-unstable; [
    tuxguitar
    niri
  ]);


  nixpkgs.config.permittedInsecurePackages = [
    "mbedtls-2.28.10"
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
