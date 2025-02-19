{ lib, stdenv, fetchFromGitHub, libutf, ncurses }:

stdenv.mkDerivation rec {
  pname = "libutf";
  version = "2018-11-13";

  src = fetchFromGitHub {
    owner = "cls";
    repo = "libutf";
    rev = "ee5074db68f498a5c802dc9f1645f396c219938a";
    hash = "sha256-pgiomcCM3PKNdryj4F6DuH3EI8dTKOIt1hr2AvBXIoQ=";
  };

  makeFlags = [ "CC:=$(CC)" ];

  installFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "Plan 9 compatible UTF-8 C library";
    inherit (src.meta) homepage;
    license = licenses.mit;
    maintainers = [ maintainers.sikmir ];
    platforms = platforms.unix;
  };
}
