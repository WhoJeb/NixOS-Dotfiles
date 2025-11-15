{ config, pkgs, lib, userSettings, systemSettings, ... }:

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
      ./../../modules/vm.nix
      ./../../modules/gaming.nix
      ./../../modules/nvidia.nix
      ./../../modules/systemd-boot.nix
      # ./../../modules/grub.nix
      ./../../modules/fcitx5.nix
      ./../../modules/drawing-tablets.nix
      # ./../../modules/syncthing.nix # Fix error
      ./../../modules/hyprland.nix
      # ./../../modules/hacking.nix
    ];

  networking.hostName = systemSettings.hostname; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;
  services.twingate.enable = true;

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

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

  # Enable the X11 windowing system
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
  };
  services.displayManager.ly.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "au,kr";
    variant = ",";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    # packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     # General
     floorp
     mako
     vlc
     mpd
     obs-studio
     kdePackages.dolphin
     syncthing
     # freerdp
     qbittorrent
     gnome-multi-writer
     udisks
     udiskie
     dmidecode
     musikcube
     ncmpcpp
     orca
     onlyoffice-desktopeditors
     # libreoffice-fresh
     # cyberduck
     filezilla
     alsa-tools
     xwayland-satellite # IDK if this actually helps but yay its here; ugh fuck bloat, and no its not 5am
     nautilus # Needed for file browsers in programs running under xwayland; 🥳 I'm so happy this works now!
     
     nicotine-plus
     soundconverter

     # Programming
     gcc
     git
     neovim
     python3
     rustup
     # rustc
     # cargo
     # rustfmt
     rust-analyzer
     pkg-config
     alsa-lib
     ruby

     # AI
     # ollama

     # Note Taking
     qownnotes
     obsidian
     # emacs

     # Proton
     protonvpn-gui
     proton-pass

     # Terminal
     cbonsai
     cmatrix
     kitty
     fzf
     btop
     wget
     fastfetch
     # alacritty
     unzip
     peazip
     rar
     zoxide
     killall
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "mbedtls-2.28.10"
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";
}
