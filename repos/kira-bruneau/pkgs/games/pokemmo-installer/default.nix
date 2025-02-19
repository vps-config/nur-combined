{ lib
, stdenv
, fetchFromGitLab
, makeWrapper
, coreutils
, findutils
, gnugrep
, jre
, openssl
, ps
, wget
, which
, xprop
, zenity
, libpulseaudio
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "pokemmo-installer";
  version = "1.4.8";

  src = fetchFromGitLab {
    owner = "coringao";
    repo = "pokemmo-installer";
    rev = "refs/tags/${finalAttrs.version}";
    sha256 = "sha256-uSbnXBpkeGM9X6DU7AikT7hG/emu67PXuGdm6xfB8To=";
  };

  nativeBuildInputs = [ makeWrapper ];

  installFlags = [
    "PREFIX=${placeholder "out"}"

    # BINDIR defaults to $(PREFIX)/games
    "BINDIR=${placeholder "out"}/bin"
  ];

  postFixup = ''
    wrapProgram "$out/bin/pokemmo-installer" \
      --prefix PATH : ${lib.makeBinPath [
        coreutils
        findutils
        gnugrep
        jre
        openssl
        ps
        wget
        which
        xprop
        zenity
      ]} \
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [
        libpulseaudio
      ]}
  '';

  meta = with lib; {
    description = "Installer and Launcher for the PokeMMO emulator";
    homepage = "https://pokemmo.eu";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ kira-bruneau ];
    platforms = platforms.linux;
  };
})
