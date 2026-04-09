let 
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.11";
  pkgs = import nixpkgs { config = {}; overlays = []; }; 
  in
pkgs.mkShell {

  nativeBuildInputs = with pkgs.buildPackages; [
    makeWrapper
    pkg-config
  ];

  buildInputs = with pkgs.buildPackages; [
    automake
    cmake
    zlib
    autoconf
    stdenv.cc
    jdk8
    clang
    python3
    erlang
    opam
    go
    rustc
    swift
  ];

  packages = with pkgs; [
    cowsay
    lolcat
  ];

  shellHook = ''
    patchShebangs . 
    echo "Welcome." | cowsay | lolcat
  '';
}