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
        ## build tools
        makeWrapper
        pkg-config
        gnumake
        automake
        autoconf
        cmake
        bash
        coreutils
        which
        zlib
        git

        opam
        stdenv.cc
        # jdk8
        clang
        python3
        erlang
        go
        # rustc
        # swift

        ## opam deps
        emacs ## required by mem-trace
        ocamlPackages.findlib
        sqlite
        gmp
        rsync

        lolcat
      ];

    # runScript = ''bash'';
    runScript = ''
      bash -c "
        echo 'Patching PKG_CONFIG_PATH...' | lolcat
        export PKG_CONFIG_PATH='${pkgs.sqlite.dev}/lib/pkgconfig:${pkgs.sqlite.out}/lib/pkgconfig:$PKG_CONFIG_PATH'

        # echo 'Disabling opam sandboxing and depext...' | lolcat
        # opam option sandboxing=false
        # opam option depext=false
        
        echo 'Updating opam...' | lolcat
        opam update
        
        echo 'make clean...' | lolcat
        make clean

        echo 'Building infer...' | lolcat
        ./build-infer.sh -y erlang

        echo 'Running devsetup...' | lolcat
        eval \$(opam env)
        make devsetup

        echo 'Manually opam installing sqlite3...' | lolcat
        eval \$(opam env)
        opam install sqlite3 --yes

        echo 'Checking for local installation .local' | lolcat
        if [ ! -d .local ]; then
          echo 'Dir .local not found, installing opam deps...' | lolcat
          opam install . --deps-only --yes
          echo 'Installing under $PWD/.local ...' | lolcat
          make install prefix=$PWD/.local
        else
          echo 'Already installed.' | lolcat
        fi

        ## export path
        echo 'Patching nix-shell FHS Env path...' | lolcat
        export PATH='$PWD/.local/bin:$PATH'
        
        echo 'Setup Finished -- Entering shell.' | lolcat
        exec bash
      "
    '';
  };
in
pkgs.mkShell {
  packages = [ fhs pkgs.lolcat ];
  shellHook = ''
    echo "Entering nix-shell FSH Env to complete setup..." | lolcat
    exec infer-nix
  '';
}
