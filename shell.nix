{ pkgs ? import <nixpkgs> {} }:
# let
#   nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.11";
#   pkgs = import nixpkgs {
#     config = { };
#     overlays = [ ];
#   };
#   inherit (pkgs) stdenv;
#   # infer = import ./infer.nix {inherit pkgs;};
#   env =
#     (pkgs.buildFHSEnv {
#       name = "fhs env";
#       targetPkgs = pkgs: [ pkgs.bash ];
#       runScript = "bash";
#     }).env;
# in
# stdenv.mkDerivation
# pkgs.mkShell 
pkgs.buildFHSEnv
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
    jdk8
    clang
    python3
    erlang
    opam
    go
    rustc
    swift


    cowsay
    lolcat
  ];
  runScript = "bash";

  # nativeBuildInputs = with pkgs.buildPackages; [
  #   makeWrapper
  #   pkg-config
  #   bash
  # ];

  # inputsFrom = with pkgs.buildPackages; [
  #   automake
  #   cmake
  #   zlib
  #   autoconf
  #   stdenv.cc
  #   jdk8
  #   clang
  #   python3
  #   erlang
  #   opam
  #   go
  #   rustc
  #   swift
  # ];

  # packages = with pkgs; [
  #   cowsay
  #   lolcat
  # ];

  shellHook = ''
    echo "Building \"./build-infer.sh -y erlang" | lolcat
    bash ./build-infer.sh -y erlang
    echo "Running \"make devsetup\"" | lolcat
    make devsetup
    echo "Welcome." | cowsay | lolcat
  '';
}

# (pkgs.buildFHSEnv {
#   name = "fhs env";
#   targetPkgs = pkgs: [ pkgs.bash ];
#   runScript = "bash";
# }).env

# pkgs.runInFHSEnv
# (
# stdenv.mkDerivation
# pkgs.mkShell
# {
#   name = "infer-nix";
#   #     version = "1.2.0";
#   #     system = "x86_64-linux";
#   nativeBuildInputs = with pkgs.buildPackages; [
#     makeWrapper
#     pkg-config
#     # bash
#   ];

#   buildInputs = with pkgs.buildPackages; [
#     automake
#     cmake
#     zlib
#     autoconf
#     stdenv.cc
#     jdk8
#     clang
#     python3
#     erlang
#     opam
#     go
#     rustc
#     swift
#     (pkgs.buildFHSEnvChroot {
#       name = "fhs env";

#       targetPkgs = pkgs: [ pkgs.bash ];
#     }).env
#   ];

#   packages = with pkgs; [
#     cowsay
#     lolcat
#   ];

#   shellHook = ''
#     # patchShebangs .
#     echo "Welcome." | cowsay | lolcat
#   '';
# }
# )
# {
#       targetPkgs = pkgs: [ pkgs.bash ];

# }










# { pkgs ? import <nixpkgs> {} }:

# let
#   # nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.11";
#   # pkgs = import nixpkgs {
#   #   config = { };
#   #   overlays = [ ];
#   # };
#   # inherit (pkgs) stdenv;
#   # infer = import ./infer.nix {inherit pkgs;};
#   # env =
#   #   (pkgs.buildFHSEnv {
#   #     name = "fhs env";
#   #     targetPkgs = pkgs: [ pkgs.bash ];
#   #     runScript = "bash";
#   #   }).env;
#   theShell = pkgs.mkShell {
#     nativeBuildInputs = with pkgs.buildPackages; [
#       makeWrapper
#       pkg-config
#       bash
#     ];

#     buildInputs = with pkgs.buildPackages; [
#       automake
#       cmake
#       zlib
#       autoconf
#       stdenv.cc
#       jdk8
#       clang
#       python3
#       erlang
#       opam
#       go
#       rustc
#       swift
#     ];

#     packages = with pkgs; [
#       cowsay
#       lolcat
#     ];


#     shellHook = ''
#       echo "Building \"./build-infer.sh -y erlang\"" | lolcat
#       bash ./build-infer.sh -y erlang
#       echo "Running \"make devsetup\"" | lolcat
#       make devsetup
#       echo "Welcome." | cowsay | lolcat
#     '';
#   };

# in
# # stdenv.mkDerivation
# # pkgs.mkShell 
# pkgs.buildFHSEnv {
#   name = "infer-nix";

#   targetPkgs = pkgs: theShell.nativeBuildInputs ++ theShell.buildInputs;
#   runScript = "bash";

#   profile = theShell.shellHook or "";
# }

# # (pkgs.buildFHSEnv {
# #   name = "fhs env";
# #   targetPkgs = pkgs: [ pkgs.bash ];
# #   runScript = "bash";
# # }).env

# # pkgs.runInFHSEnv
# # (
# # stdenv.mkDerivation
# # pkgs.mkShell
# # {
# #   name = "infer-nix";
# #   #     version = "1.2.0";
# #   #     system = "x86_64-linux";
# #   nativeBuildInputs = with pkgs.buildPackages; [
# #     makeWrapper
# #     pkg-config
# #     # bash
# #   ];

# #   buildInputs = with pkgs.buildPackages; [
# #     automake
# #     cmake
# #     zlib
# #     autoconf
# #     stdenv.cc
# #     jdk8
# #     clang
# #     python3
# #     erlang
# #     opam
# #     go
# #     rustc
# #     swift
# #     (pkgs.buildFHSEnvChroot {
# #       name = "fhs env";

# #       targetPkgs = pkgs: [ pkgs.bash ];
# #     }).env
# #   ];

# #   packages = with pkgs; [
# #     cowsay
# #     lolcat
# #   ];

# #   shellHook = ''
# #     # patchShebangs .
# #     echo "Welcome." | cowsay | lolcat
# #   '';
# # }
# # )
# # {
# #       targetPkgs = pkgs: [ pkgs.bash ];

# # }
