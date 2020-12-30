{ stdenvNoCC, lib, dict, pandoc, stardict-tools, sources }:

stdenvNoCC.mkDerivation {
  pname = "it-sanasto";
  version = lib.substring 0 10 sources.it-sanasto.date;

  src = sources.it-sanasto;

  nativeBuildInputs = [ dict pandoc stardict-tools ];

  buildPhase = ''
    for i in *.md; do
      pandoc -f markdown -t html -s $i | awk -F "</*td>" '/<\/*td>.*/ {print $2}'
    done | paste -d"#" - - - | sed 's/#/\t/;s/#/\\n/' > it-sanasto.tab

    stardict-tabfile it-sanasto.tab
  '';

  installPhase = "install -Dm644 *.{dict*,idx,ifo} -t $out";

  meta = with lib; {
    inherit (sources.it-sanasto) description homepage;
    license = licenses.mit;
    maintainers = [ maintainers.sikmir ];
    platforms = platforms.all;
  };
}
