{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    hyprland
    hyprshot
    hyprpaper
    hyprpicker
    hypridle
    hyprlock
  ];
}
