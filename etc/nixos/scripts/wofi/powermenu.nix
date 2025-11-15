{ pkgs }:

pkgs.writeShellScriptBin "powermenu" ''
entries="⇠ Logout\n⏾ Suspend\n⭮ Reboot\n⏻ Shutdown"

selected=$(echo -e $entries|${pkgs.wofi}/bin/wofi --width 250 --height 320 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    exec ${pkgs.niri}/bin/niri msg action quit;;
    # exec hyprland dispatch exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
''
