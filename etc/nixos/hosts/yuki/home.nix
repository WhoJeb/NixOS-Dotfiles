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
resizeBinds = [
  "resize, l, resizeactive 50 0"
  "resize, h, resizeactive -50 0"
  "resize, k, resizeactive 0 -50"
  "resize, j, resizeactive 0 50"
  "resize, escape, submap, reset"
];
moveBinds = [
    "move, l, movewindow, r"
    "move, h, movewindow, l"
    "move, k, movewindow, u"
    "move, j, movewindow, d"
    "move, escape, submap, reset"
];
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
  
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun";

      "monitor" = ",preferred,auto,1.2";

      exec-once = [
        "waybar"
        "hypridle"
        "mako"
        "udiskie"
        "mpd"
        "xwayland"
        "xwayland-satellite"
        "hyprpaper"
        "syncthing"
        # "ollama serve"
        "randomAnimeWal" # Generated under scripts/randomWal.nix
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 0;

        "col.active_border" = "rgba(595959ff)";
        "col.inactive_border" = "rgba(59595977)";

        resize_on_border = true;

        allow_tearing = false;

        layout = "master";
      };

      xwayland = {
        force_zero_scaling = true;
      };

      decoration = {
        rounding = 10;
        round_power = 2;

        active_opacity = 1.0;
        inactive_opacity = 0.8;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 5;
          passes = 4;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = "yes, please :)";
        
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
        mfact = 0.50;
        new_on_top = true;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = false;
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        repeat_rate = 35;
        repeat_delay = 200;

        follow_mouse = 0;

        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
        };
      };

      cursor = {
        inactive_timeout = 5;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMuteVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        "XF86AudioNext, exec, playerctl next"
        "XF86AudioPause, exec, playerctl play-pause"
        "XF86AudioPlay, exec, playerctl play-pause"
        "XF86AudioPrev, exec, playerctl previous"
      ];

      bind = [
        "$mod, RETURN, exec, $terminal"
        "$mod, X, killactive,"
        "$mod SHIFT, Q, exec, powermenu"
        "$mod, V, togglefloating,"
        "$mod, SPACE, exec, $menu"
        "$mod SHIFT, T, exec, randomAnimeWal"
        "$mod, P, pseudo,"
        "$mod, I, togglesplit,"

        "SUPER, F, fullscreen"
        # "SUPER, c, exec, bash ~/.config/wofi/keybinds.sh"
        "SUPER, E, exec, wofi-emoji"
        
        # Move focus with mainMod + arrow keys
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        "$mod, R, submap, resize"
        "$mod, M, submap, move"

        ", PRINT, exec, hyprshot -m window"
        "SHIFT, PRINT, exec, hyprScreenshot"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        )
        9)
      )
      ++ resizeBinds
      ++ moveBinds;
    };
  };

  # put programs you want to be managed by the user/user only apps
  # home.packages = with pkgs; [

  # ];
}
