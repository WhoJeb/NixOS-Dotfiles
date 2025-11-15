{ pkgs }:

pkgs.writeShellScriptBin "nixmenu" ''
entries=" Rebuild\n Update\n Garbage\nPackages\nGenerations\n Edit"

selected=$(echo -e $entries|${pkgs.wofi}/bin/wofi --width 250 --height 500 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

spawn_float() {
  ${pkgs.niri}/bin/niri msg action spawn -- kitty --title "NixOS Menu" sh -c "$1; exec bash"
}

case $selected in
  rebuild)
    spawn_float "sudo nixos-rebuild switch --flake /etc/nixos#yuki";;
  update)
    spawn_float "sudo nix flake update --flake ~/etc/nixos";;
  garbage)
    spawn_float "sudo nix-collect-garbage --delete-older-than 2d; exec zsh";;
  packages)
    spawn_float "ls /run/current-system/sw/bin/ ~/.nix-profile/bin/; exec zsh";;
  generations)
    spawn_float "nix-env --list-generations";;
  edit)
    # Figure out glitch in this command then make all fuctions run in floating window
    # niri msg action spawn -- --rule 'open-floating true; default-floating-position x=100 y=100;' -- kitty 
    spawn_float "sudo nvim /etc/nixos/";;
esac
''

