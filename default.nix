with import <nixpkgs> {};
let
  buildInputs = [
    binutils
    zlib
    xorg.libX11
    xorg.libXft
    xorg.libXinerama
    libexif
    imlib2
    giflib
  ];
in
stdenv.mkDerivation {
  system = builtins.currentSystem;
  buildInputs = buildInputs;
  name = "sxiv-gallo";
  src = ./.;
  makeFlags = [ "CC:=$(CC)" ];
  preConfigure = ''
    sed -i "s@PREFIX = /usr/local@PREFIX = $out@g" Makefile
  '';
}
