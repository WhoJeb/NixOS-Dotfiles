{ ... }:
{
  # Auto Updating
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";

  system.autoUpgrade.flake = "./../flake.nix";

  # Auto Garbage Collecting
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 2d";
  nix.settings.auto-optimise-store = true;
}
