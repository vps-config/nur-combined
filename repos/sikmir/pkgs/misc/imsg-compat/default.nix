{ lib, stdenv, fetchFromGitHub, validatePkgConfig }:

stdenv.mkDerivation rec {
  pname = "imsg-compat";
  version = "6.8.2";

  src = fetchFromGitHub {
    owner = "bsd-ac";
    repo = "imsg-compat";
    rev = version;
    hash = "sha256-TFwww3HnTuURVCSMWyaMfwjEWcgGQr1pyPkop6EoHIY=";
  };

  postPatch = ''
    substituteInPlace libimsg.pc.in \
      --subst-var-by LIBDIR "lib"
  '';

  nativeBuildInputs = [ validatePkgConfig ];

  makeFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "Unofficial port of OpenBSD's imsg utilities";
    inherit (src.meta) homepage;
    license = licenses.isc;
    maintainers = [ maintainers.sikmir ];
    platforms = platforms.linux;
    skip.ci = stdenv.isDarwin;
  };
}
