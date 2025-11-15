{ pkgs }:

pkgs.writeShellScriptBin "hyprScreenshot" ''
${pkgs.hyprshot}/bin/hyprshot -m region -o ~/Pictures/Screenshots/
''
