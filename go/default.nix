let
  _pkgs = import <nixpkgs> {};
in
{ pkgs ? import (_pkgs.fetchFromGitHub { owner = "NixOS";
                                         repo = "nixpkgs-channels";
                                         rev = "685bfcee633774d730cd3da2fba6eb39a1b767b9";
                                         sha256 = "19dkf81z8hradbqa7asi89f9wzr02iygk4sr3zj3k94f8lg1q3za";
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
