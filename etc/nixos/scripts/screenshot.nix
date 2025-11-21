{ pkgs }:

pkgs.writeShellScriptBin "hyprScreenshot" ''
${pkgs.grim}/bin/grim -l 0 -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.wl-clipboard}/bin/wl-copy
''
