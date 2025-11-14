{
  description = "";
  inputs = {
    # Nixpkgs
    nixpkgs.url = "nixpkgs/nixos-25.05";
    unstable.url = "nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NVF (NixVim Flake)
    nvf.url = "github:notashelf/nvf";

    # Stylix
    stylix.url = "github:danth/stylix";

    # hyprland
    # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    
    # Zen
    # zen-browser.url = "github:0xc000022070/zen-browser-flake";


    
    # ---- Quickshell ---- #
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "unstable";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "unstable";
      inputs.quickshell.follows = "quickshell";  # Use same quickshell version
    };

    # ---- Nix-Alien ---- #
    nix-alien.url = "github:thiagokokada/nix-alien";
  };

  outputs = { self, nixpkgs, unstable, home-manager, nvf, ... }@inputs: # stylix,
    let
      # ---- System Settings ---- #
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      unstablePkgs = import unstable { inherit system; };

      systemSettings = rec {
        hostname = "yuki"; # Hostname
        profile = hostname; # Select a profile from profiles directory
        timezone = "Australia/Melbourne"; # Select timezone
        locale = "en_GB.UTF-8"; # Select locale
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
            # (./. + "/modules"+"/noctalia.nix")

	        nvf.nixosModules.default
            # stylix.nixosModules.stylix

          # Unstable Nixpkgs
          ({
            environment.systemPackages = with pkgs; [
              unstablePkgs.blanket
              unstablePkgs.foliate
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
          ];
          # modules = [ ./home.nix ];
        extraSpecialArgs = {
          inherit userSettings;
          inherit systemSettings;
          inherit inputs;
        };
      };
    };
  };  
}
