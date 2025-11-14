{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.meslo-lg
    nerd-fonts._3270
    nerd-fonts.fira-code
    nerd-fonts.symbols-only

    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    babelstone-han
  ];
}
