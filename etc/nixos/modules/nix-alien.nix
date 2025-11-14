{ CurrentSystem, lib, ... }:
let
  nix-alien-pkgs = import (
    builtins.currentSystem.fetchTarball { 
      url = "https://github.com/thiagokokada/nix-alien/tarball/master";
      # sha256 = "${lib.fakeSha256}";
      sha256 = "1x8jhyifgdrzp9k6fv7c7hij9l4snz46cnw118kxvah57ph8qdn0";
    }
  ) { };
in
{
  environment.systemPackages = with nix-alien-pkgs; [
    nix-alien
  ];

  # Optional, but this is needed for `nix-alien-ld` command
  programs.nix-ld.enable = true;
}
