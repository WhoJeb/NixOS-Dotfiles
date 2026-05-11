{ pkgs }:
[
  (import ./randomWal.nix { inherit pkgs; })
  (import ./randomAnimeWal.nix { inherit pkgs; })
  (import ./hyprScreenshot.nix { inherit pkgs; })
  (import ./wofi/nixmenu.nix { inherit pkgs; })
  (import ./wofi/powermenu.nix { inherit pkgs; })
  (import ./randomMashedWal.nix { inherit pkgs; })
  (import ./randomAzlaarWal.nix { inherit pkgs; })
  (import ./randomDestinyWal.nix { inherit pkgs; })
]
