{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSEnv
{
  name = "infer-nix";

  targetPkgs = pkgs: with pkgs; 
  with pkgs.buildPackages;
  [ 
    makeWrapper
    pkg-config
  bash 


   automake
    cmake
    zlib
    autoconf
    stdenv.cc
    # jdk8
    clang
    python3
    erlang
    opam
    go
    # rustc
    # swift


    # cowsay
    # lolcat
  ];
  runScript = "bash";

  # shellHook = ''
  #   echo "Building \"./build-infer.sh -y erlang" | lolcat
  #   bash ./build-infer.sh -y erlang
  #   echo "Running \"make devsetup\"" | lolcat
  #   make devsetup
  #   echo "Welcome." | cowsay | lolcat
  # '';
}).env
