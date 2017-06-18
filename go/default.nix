let
  _pkgs = import <nixpkgs> {};
in
{ pkgs ? import (_pkgs.fetchFromGitHub { owner = "NixOS";
                                         repo = "nixpkgs-channels";
					 rev = "0d4431cfe90b2242723ccb1ccc90714f2f68a609";
					 sha256 = "0iil6dx91widz66avnbs4m8lhygmadhyma1m2kbq57iwj73yql3w";
                                       }) {}
}:

  pkgs.stdenv.mkDerivation rec {
    name = "go-projects";
    env = pkgs.buildEnv { name = name; paths = buildInputs; };
    buildInputs = [
      pkgs.go_1_8
      pkgs.vndr
      pkgs.gnumake
      pkgs.glide
      pkgs.gcc
      pkgs.gotools
      pkgs.golint
      pkgs.godef
      pkgs.go-bindata
    ];
  }
