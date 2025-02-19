{ lib
, runCommand
, buildGoModule
, fetchFromGitHub
, makeBinaryWrapper
, symlinkJoin
, v2ray-geoip
, v2ray-domain-list-community
, sources
}:
let
  assetsDrv = symlinkJoin {
    name = "mosdns-assets";
    paths = [
      "${v2ray-geoip}/share/v2ray"
      "${v2ray-domain-list-community}/share/v2ray"
    ];
  };
  mosdns = buildGoModule {
    pname = "mosdns";
    inherit (sources.mosdns) version src;
    vendorSha256 = "sha256-4Ptvr76xU+tr5FZSFjD3bQI/TYNjnyMBCWofrXWqENY=";
    doCheck = false;

    buildPhase = ''
      buildFlagsArray=(-v -p $NIX_BUILD_CORES -ldflags="-s -w")
      runHook preBuild
      go build "''${buildFlagsArray[@]}" -o mosdns ./
      runHook postBuild
    '';

    installPhase = ''
      install -Dm755 mosdns -t $out/bin
    '';

    meta = with lib; {
      description = "A DNS proxy server";
      homepage = "https://github.com/IrineSistiana/mosdns";
      license = licenses.gpl3;
    };
  };
in
runCommand mosdns.name
{
  inherit (mosdns) version meta pname;
  nativeBuildInputs = [ makeBinaryWrapper ];
  passthru = {
    original = mosdns;
  };
} ''
  makeWrapper ${mosdns}/bin/mosdns "$out/bin/mosdns" --chdir ${assetsDrv}
''
