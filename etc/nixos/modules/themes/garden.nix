{ pkgs, ... }:
{
  stylix.image = "/home/jeremiah/Pictures/Wallpapers/Good/Spring_Serenity_girl.png"; # same functionality as pywal but auto sets apps to colourscheme

  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font Mono";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sizes = {
      applications = 12;
      terminal = 15;
      desktop = 10;
      popups = 10;
    };
  };

  stylix.opacity = {
    applications = 1.0;
    terminal = 0.8;
    desktop = 1.0;
    popups = 0.8;
  };

  stylix.polarity = "dark"; # dark, light, either
}
