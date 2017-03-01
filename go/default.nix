{ }:

let
  pkgs = import <nixpkgs> { };
in
  pkgs.stdenv.mkDerivation {
    name = "go projects";
    env = pkgs.buildEnv { name = name; paths = buildInputs; };
    buildInputs = [
      pkgs.go_1_7
      pkgs.vndr
      pkgs.gnumake
      pkgs.glide
      pkgs.gcc
      pkgs.gotools
      pkgs.golint
      pkgs.goimports
      pkgs.godef
    ];
  }
