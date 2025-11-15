{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ida-free
    ghidra
    thc-hydra
    hashcat
    john
    johnny
    nmap
  ];
}
