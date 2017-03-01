let
  _pkgs = import <nixpkgs> {};
in
{ pkgs ? import (_pkgs.fetchFromGitHub { owner = "NixOS";
                                         repo = "nixpkgs-channels";
                                         rev = "a9584c9510771f96594b4461e9ea546a75bf59d4";
                                         sha256 = "0in14479h1bjpvh7ncsc57vla06x57cnhnlypb3rml78nkgn0fyk";
                                       }) {}
}:

  pkgs.stdenv.mkDerivation rec {
    name = "go-projects";
    env = pkgs.buildEnv { name = name; paths = buildInputs; };
    buildInputs = [
      pkgs.go_1_7
      pkgs.vndr
      pkgs.gnumake
      pkgs.glide
      pkgs.gcc
      pkgs.gotools
      pkgs.golint
      pkgs.godef
    ];
  }
