{
  description = "";
  inputs = {
    # Nixpkgs
    nixpkgs.url = "nixpkgs/nixos-25.11";
    unstable.url = "nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "unstable";
    };

    # NVF (NixVim Flake)
    nvf.url = "github:notashelf/nvf";

    # Stylix
    stylix.url = "github:danth/stylix";

    # Quickshell
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "unstable";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "unstable";
    };

    # hyprland
    # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    
    # Zen
    # zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # ---- Nix-Alien ---- #
    nix-alien.url = "github:thiagokokada/nix-alien";
  };

  outputs = { 
    self, 
    nixpkgs, 
    unstable, 
    home-manager, 
    nvf, 
    mangowc,
    quickshell,
    noctalia,
    ... 
    }@inputs: # stylix,
    let
      # ---- System Settings ---- #
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      unstablePkgs = import unstable { inherit system; };

      systemSettings = rec {
        hostname = "sundance"; # Hostname
        profile = hostname; # Select a profile from profiles directory
        timezone = "Australia/Melbourne"; # Select timezone
        locale = "en_AU.UTF-8"; # Select locale
        # locale = "pt_BR.UTF-8"; # Select locale
        # locale = "ja_JP.UTF-8"; # Select locale
      };

      # ---- User Settings ---- #
      userSettings = rec {
        username = "jeremiah"; # username
        name = "Jeremiah"; # name/identifier
        email = "who.jeb@proton.me"; # email (used for some configs)
        dotfilesDir = "~/.config"; # absolute path of the machine configs 
        theme = "pywal"; # selected theme from themes directory (./themes/)
        wm = "niri";
        wmType = if (wm == "hyprland" || "niri") then "wayland" else "x11"; # wayland or x11
        browser = "floorp"; # default browser
        editor = "nvim"; # default editor
        term = "kitty";
        font = "JetBrainsMono Nerd Font Mono";
        # fontPkg = pkgs.nerd-fonts.jetbrains-mono;
      };
    in {
    nixosConfigurations = {
      ${systemSettings.hostname} = lib.nixosSystem {
        inherit system;

          # modules = [ (./. + "/hosts"+("/"+userSettings.profile)+"/configuration.nix") ];  

        modules = [
          (./. + "/hosts"+("/"+systemSettings.profile)+"/configuration.nix")
            # (./. + "/hosts"+("/"+systemSettings.profile)+"/hardware-configuration.nix")

	        nvf.nixosModules.default

          mangowc.nixosModules.mango

            # stylix.nixosModules.stylix

          # Unstable Nixpkgs
          ({
            environment.systemPackages = with pkgs; [
                # unstablePkgs.foliate
              quickshell.packages.${system}.default
              noctalia.packages.${system}.default
            ];
          })
	      ];

        specialArgs = {
            # pass variables through
            inherit userSettings;
            inherit systemSettings;
            inherit inputs;
        };
      };
    };

    homeConfigurations = {
      userSettings.username = home-manager.lib.homeManagerConfiguration {
      	inherit pkgs;

        modules = [ 
            (./. + "/hosts"+("/"+userSettings.profile)+"/home.nix")
            # mangowc.nixosModules.mango
        ];
        
        extraSpecialArgs = {
          inherit userSettings;
          inherit systemSettings;
          inherit inputs;
        };


          # programs.mango.enable = true;
      };
    }; 
  };
}
