{
  pkgs ? import <nixpkgs> { },
}:

let
  fhs = pkgs.buildFHSEnv {
    name = "infer-nix";

    targetPkgs =
      pkgs:
      with pkgs;
      with pkgs.buildPackages;
      [
        # makeWrapper
        # pkg-config
        bash
        automake
        cmake
        zlib
        autoconf
        opam
        stdenv.cc
        # jdk8
        clang
        python3
        erlang
        go
        # rustc
        # swift
      ];

    runScript = ''
      bash -c "
        eval $(opam env)

        echo 'Running devsetup...'
        make devsetup

        echo 'Checking for local installation .local'
        if [ ! -d .local ]; then
          echo 'Dir .local not found, installing...'
          make install prefix=$PWD/.local
        else
          echo 'Already installed.'
        fi

        ## export path
        export PATH='$PWD/.local/bin:$PATH'
        
        exec bash
      "
    '';
  };
in
pkgs.mkShell {
  packages = [ fhs ];
  shellHook = ''
    exec infer-nix
  '';
}
