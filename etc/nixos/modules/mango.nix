{ config, pkgs, ... }:

{
  programs.mango.enable = true;

  environment.systemPackages = with pkgs; [
    wlr-protocols
    wmenu
    swaybg
    grim
    slurp
    wl-clipboard
  ];

  # Set fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
