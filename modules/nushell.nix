{ home-manager, pkgs, config, userSettings, ... }:

{
  programs = {
      nushell = { 
        enable = true;
        # The config.nu can be anywhere you want if you like to edit your Nushell with Nu
        # configFile.source = ./.../config.nu;
        # for editing directly to config.nu 
        extraConfig = ''
         let carapace_completer = {|spans|
         carapace $spans.0 nushell ...$spans | from json
         }
         $env.config = {
          show_banner: false,
          completions: {
          case_sensitive: false # case-sensitive completions
          quick: true    # set to false to prevent auto-selecting completions
          partial: true    # set to false to prevent partial filling of the prompt
          algorithm: "fuzzy"    # prefix or fuzzy
          external: {
          # set to false to prevent nushell looking into $env.PATH to find more suggestions
              enable: true 
          # set to lower can improve completion performance at the cost of omitting some options
              max_results: 100 
              completer: $carapace_completer # check 'carapace_completer' 
            }
          }
         } 
         $env.PATH = ($env.PATH | 
         split row (char esep) |
         prepend /home/myuser/.apps |
         append /usr/bin/env
         )
         '';
         shellAliases = {
           ls = "ls -a -d --color";
           music = "ncmpcpp";
           extract = "tar -xvf";
           fonts = "fc-list : family style";
           wttr = "curl wttr.in";
           update = "sudo nix flake update";
           rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#yuki";
           garbage = "sudo nix-collect-garbage --delete-older-than 2d";
           gen = "nix-env --list-generations";
           packs = "ls /run/current-system/sw/bin/ ~.nix-profile/bin/";
         };
     };  
     carapace.enable = true;
     carapace.enableNushellIntegration = true;

     starship = { 
         enable = true;
         settings = {
           add_newline = true;
           character = { 
           success_symbol = "[➜](bold green)";
           error_symbol = "[➜](bold red)";
         };
      };
    };
  };
}
