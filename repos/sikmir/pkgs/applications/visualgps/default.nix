{ lib
, stdenv
, mkDerivation
, fetchFromGitHub
, qmake
, qtserialport
}:

mkDerivation rec {
  pname = "visualgps-unstable";
  version = "2020-03-29";

  src = fetchFromGitHub {
    owner = "VisualGPS";
    repo = "VisualGPSqt";
    rev = "f2e213208a48e1f7d7294bc832a848de4efb4fd4";
    sha256 = "0f66xaisvgrjd25129li4lbp34d2hmw49i44vqq06hinjvpma7yp";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ qmake ];

  buildInputs = [ qtserialport ];

  qmakeFlags = [ "Software/VisualGPSqt/Source/VisualGPSqt.pro" ];

  postInstall = if stdenv.isDarwin then ''
    mkdir -p $out/Applications
    mv *.app $out/Applications
    wrapQtApp $out/Applications/VisualGPSqt.app/Contents/MacOS/VisualGPSqt
  '' else ''
    install -Dm755 VisualGPSqt -t $out/bin
  '';

  meta = with lib; {
    description = "A QT application (GUI) that makes use of the VisualGPS/NMEAParser project";
    homepage = src.meta.homepage;
    license = licenses.mit;
    maintainers = [ maintainers.sikmir ];
    platforms = platforms.unix;
  };
}
