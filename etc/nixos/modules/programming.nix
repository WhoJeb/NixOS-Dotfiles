{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [

    # ---- General ---- #
    lazygit
    pkg-config
    neovim
    git
    
    # ---- Java ---- #
    # jetbrains.idea-community-bin
    # eclipses.eclipse-java
    # jdk24
    # gradle
    # maven

    # ---- Python ---- #
    # jetbrains.pycharm-community-bin
    python3
    # python313Packages.pygame

    # ---- C & C++ ---- #
    gcc
    # libGLU
    # sdl3
    
    # ---- Ruby ---- #
    ruby

    # ---- Rust ---- #
    # rustup
    # rustc
    # cargo
    # rustfmt
    # rust-analyzer

    # ---- Zig ---- #
    # zig
  ];
}
