{
  pkgs,
  sources,
}:
pkgs.stdenv.mkDerivation {
  inherit (sources.luakit) pname version src;

  nativeBuildInputs = with pkgs; [
    pkg-config
    wrapGAppsHook
  ];

  buildInputs = with pkgs;
    [
      glib-networking
      gtk3
      luajit
      luajitPackages.luafilesystem
      sqlite
      webkitgtk
    ]
    ++ (with pkgs.gst_all_1; [
      gstreamer
      gst-plugins-base
      gst-plugins-good
      gst-plugins-bad
      gst-plugins-ugly
      gst-libav
    ]);

  makeFlags = [
    "DEVELOPMENT_PATHS=0"
    "USE_LUAJIT=1"
    "INSTALLDIR=${placeholder "out"}"
    "PREFIX=${placeholder "out"}"
    "USE_GTK3=1"
    "XDGPREFIX=${placeholder "out"}/etc/xdg"
  ];

  preFixup = let
    luaKitPath = "$out/share/luakit/lib/?/init.lua;$out/share/luakit/lib/?.lua";
  in ''
    gappsWrapperArgs+=(
      --prefix XDG_CONFIG_DIRS : "$out/etc/xdg"
      --prefix LUA_PATH ';' "${luaKitPath};$LUA_PATH"
      --prefix LUA_CPATH ';' "$LUA_CPATH"
    )
  '';

  preBuild = ''
    export LUA_PATH="$LUA_PATH;./?.lua;./?/init.lua"
  '';

  inherit (pkgs.luakit) meta;
}
