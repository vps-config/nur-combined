# This file is a modified version of nixpkgs/pkgs/applications/networking/instant-messengers/nheko/default.nix (copied at 2e896fce)

{ lib
, stdenv
, fetchFromGitHub
, fetchpatch
, cmake
, cmark
, lmdb
, lmdbxx
, libsecret
, mkDerivation
, qtbase
, qtkeychain
, qtmacextras
, qtmultimedia
, qttools
, qtquickcontrols2
, qtgraphicaleffects
, mtxclient
, boost17x
, spdlog
, fmt
, olm
, pkg-config
, asciidoctor
, nlohmann_json
, voipSupport ? true
, gst_all_1
, libnice
, libevent
, curl
, coeurl
}:

mkDerivation rec {
  pname = "nheko";
  version = "unstable-2022-08-30";

  src = fetchFromGitHub {
    owner = "Nheko-Reborn";
    repo = "nheko";
    rev = "130e1b43fbc62eec1d3a5add8e15b1ef8863dcff";
    sha256 = "sha256-PaILsDykG+n+2LKKC6QgWpLbp6zBQYdhd2Ph4/P+5pI=";
  };

  nativeBuildInputs = [
    lmdbxx
    cmake
    pkg-config
    asciidoctor
  ];

  buildInputs = [
    nlohmann_json
    mtxclient
    olm
    boost17x
    libsecret
    lmdb
    spdlog
    fmt
    cmark
    qtbase
    qtmultimedia
    qttools
    qtquickcontrols2
    qtgraphicaleffects
    qtkeychain
    libevent
    curl
    coeurl
  ] ++ lib.optional stdenv.isDarwin qtmacextras
    ++ lib.optionals voipSupport (with gst_all_1; [
      gstreamer
      gst-plugins-base
      (gst-plugins-good.override { qt5Support = true; })
      gst-plugins-bad
      libnice
    ]);

  cmakeFlags = [
    "-DCOMPILE_QML=ON" # see https://github.com/Nheko-Reborn/nheko/issues/389
    "-DCMAKE_BUILD_TYPE=Release"
    "-DBUILD_SHARED_LIBS=OFF"
  ];


  preFixup = lib.optionalString voipSupport ''
    # add gstreamer plugins path to the wrapper
    qtWrapperArgs+=(--prefix GST_PLUGIN_SYSTEM_PATH_1_0 : "$GST_PLUGIN_SYSTEM_PATH_1_0")
  '';

  meta = with lib; {
    description = "Desktop client for the Matrix protocol";
    homepage = "https://github.com/Nheko-Reborn/nheko";
    platforms = platforms.all;
    # Should be fixable if a higher clang version is used, see:
    # https://github.com/NixOS/nixpkgs/pull/85922#issuecomment-619287177
    broken = stdenv.targetPlatform.isDarwin;
    license = licenses.gpl3Plus;
  };
}
