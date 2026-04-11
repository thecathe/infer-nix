# # let
# #   nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.11";
# #   pkgs = import nixpkgs {
# #     config = { };
# #     overlays = [ ];
# #   }; 
# #   in
# { pkgs }:
# (pkgs.buildFHSEnv {
#   name = "fhs env";
#   targetPkgs = pkgs: [ pkgs.bash ];
#   runScript = "bash";
# }).env