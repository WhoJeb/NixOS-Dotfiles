{ config, pkgs, lib, userSettings, systemSettings, ... }:

{
  # ---- Imports ---- #
  imports =
    [ 
      ./hardware-configuration.nix # Include the results of the hardware scan.
      ./../../modules/updates.nix
      ./../../modules/audio.nix
      ./../../modules/niri.nix
      # ./../../modules/nix-alien.nix
      ./../../modules/locale.nix
      ./../../modules/fonts.nix
      ./../../modules/nvf.nix
      # ./../../modules/vm.nix
      # ./../../modules/gaming.nix
      ./../../modules/nvidia.nix
      ./../../modules/systemd-boot.nix
      # ./../../modules/grub.nix
    ];


  # ---- Enable networking ---- #
  networking.hostName = systemSettings.hostname; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;
  services.twingate.enable = true;

  # ---- Flatpack ---- #
  # services.flatpak.enable = true;

  # ---- Shells ---- #
  environment.shells = with pkgs; [ zsh bash fish ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  
  # ---- Docker ---- #
  # virtualisation.docker.enable = true;

  # ---- Enable for graphics acceleration ---- #
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # ---- Usb Support ---- #
  services.udisks2.enable = true;

  # ---- Auto-Mount Mobile Device File Systems ---- #
  services.gvfs.enable = true;

  # ---- xWayland ---- #
  programs.xwayland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # ---- Enable the X11 windowing system ---- #
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
  };
  services.displayManager.ly.enable = true;

  # ---- Configure keymap in X11 ---- #
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  # ---- Define a user account. Don't forget to set a password with ‘passwd’. ---- #
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" ]; # docker
    # packages = with pkgs; [];
  };

  # ---- Allow unfree packages ---- #
  nixpkgs.config.allowUnfree = true;

  # ---- System Packages ---- #
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     # ---- General ---- #
     floorp
     mako
     vlc
     mpd
     # obs-studio
     kdePackages.dolphin
     syncthing
     obsidian
     # freerdp
     qbittorrent
     gnome-multi-writer
     udisks
     udiskie
     dmidecode
     # musikcube
     ncmpcpp
     orca
     libreoffice-fresh
     # cyberduck
     filezilla
     alsa-tools
     neovim
     blanket
     foliate

     # ---- Programming ---- #
     gcc
     git
     python3
     rustup
     # rustc
     # cargo
     # rustfmt
     rust-analyzer
     pkg-config
     alsa-lib
     godot

     # ---- AI ---- #
     # ollama

     # ---- Terminal ---- #
     cbonsai
     cmatrix
     kitty
     fzf
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
  system.stateVersion = "25.11";
}
