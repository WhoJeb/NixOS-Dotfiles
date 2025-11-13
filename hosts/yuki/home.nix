{ userSettings, pkgs, ... }:
let
myAliases = {
  btw = "echo I use NixOS, btw";
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
in
{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;
  programs.git.enable = true;
  home.stateVersion = "25.05";

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.fish = {
    enable = true;
    shellAliases = myAliases;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "forgit"; src = pkgs.fishPlugins.forgit.src; }
      { name = "fzf"; src = pkgs.fzf.src; }
      # Manually packaging and enable a plugin
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
          sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
        };
      }
    ];
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

  # home.file.".config/nvim".source = .config/nvim;
  
  # put programs you want to be managed by the user/user only apps
  # home.packages = with pkgs; [

  # ];
}
