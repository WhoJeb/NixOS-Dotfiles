{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [

    # ---- General ---- #
    lazygit
    pkg-config
    neovim
    git

    # ---- Man Pages ---- #
    man-pages
    man-pages-posix
    
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
    # Compilers
    gcc
    clang

    # Build System
    cmake
    pkg-config
    
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
