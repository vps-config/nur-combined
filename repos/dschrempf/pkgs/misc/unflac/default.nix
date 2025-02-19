{ lib
, buildGoModule
, fetchFromSourcehut
, ffmpeg
, makeWrapper
}:

buildGoModule rec {
  pname = "unflac";
  version = "0.9";

  src = fetchFromSourcehut {
    owner = "~ft";
    repo = "unflac";
    rev = version;
    hash = "sha256-SO/iHuReTlm7j/sH5pi5V2TV/ks9MVu92UQ1LVRu54o=";
  };

  vendorSha256 = "sha256-VEWfUinVQNhqK72yliRNi2NUClR9GVHve0uBt0IHKB0=";

  postInstall = ''
    wrapProgram $out/bin/unflac \
      --prefix PATH : ${lib.getBin ffmpeg}/bin
  '';

  nativeBuildInputs = [ makeWrapper ];
  # buildInputs = [];
  # propagatedBuildInputs = [ ];

  meta = with lib; {
    description = "A command line tool for fast frame accurate audio image + cue sheet splitting";
    homepage = "https://git.sr.ht/~ft/unflac";
    license = licenses.mit;
    maintainers = with maintainers; [ dschrempf ];
  };
}
