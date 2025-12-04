{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    # extraCompatPackages = [];
  };
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
     # ---- Gaming ---- #
     lutris
     heroic
     xwayland
     xwayland-satellite
     wine
     mangohud
     protonup-ng
     cage

     # ---- Emulators ---- #
     cemu # Wii U
     azahar # Nintendo 3DS
     melonDS # Nintendo DS
     mgba # Game Boy Advance
     dolphin-emu # GameCube and the Wii
     ryubing # Nintendo Switch
     retroarch-full # PS1
     pcsx2 # PS2
     rpcs3 # PS3

    # ---- Game Exploitation ---- #
    scanmem # incl gameconqueror as ui
  ];
}

