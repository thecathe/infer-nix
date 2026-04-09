{ stdenv }:
let
  version = "1.2.0";
in
stdenv.mkDerivation rec {
  pname = "infer-nix";
  version = version;
  system = "x86_64-linux";
  src = ./.;
  nativeBuildInputs = [];
  buildInputs = [];
  buildPhase = ''
    make install
  '';
}
