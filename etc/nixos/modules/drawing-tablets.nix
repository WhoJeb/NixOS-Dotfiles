{ config, ... }:

{
  hardware.opentabletdriver.enable = true; # enable kernel module
  hardware.opentabletdriver.daemon.enable = true; # autostart
}
