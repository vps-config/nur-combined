{ lib
, stdenv
, fetchFromGitHub
, glslang
, meson
, ninja
, pkg-config
, libX11
, spirv-headers
, vulkan-headers
, vkBasalt32
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "vkBasalt";
  version = "0.3.2.6";

  src = fetchFromGitHub {
    owner = "DadSchoorse";
    repo = "vkBasalt";
    rev = "refs/tags/v${finalAttrs.version}";
    sha256 = "sha256-wk/bmbwdE1sBZPlD+EqXfQWDITIfCelTpoFBtNtZV8Q=";
  };

  nativeBuildInputs = [ glslang meson ninja pkg-config ];
  buildInputs = [ libX11 spirv-headers vulkan-headers ];
  mesonFlags = [ "-Dappend_libdir_vkbasalt=true" ];

  # Include 32bit layer in 64bit build
  postInstall = lib.optionalString (stdenv.hostPlatform.system == "x86_64-linux") ''
    ln -s ${vkBasalt32}/share/vulkan/implicit_layer.d/vkBasalt.json \
      "$out/share/vulkan/implicit_layer.d/vkBasalt32.json"
  '';

  meta = with lib; {
    description = "A Vulkan post processing layer for Linux";
    homepage = "https://github.com/DadSchoorse/vkBasalt";
    license = licenses.zlib;
    maintainers = with maintainers; [ kira-bruneau ];
    platforms = platforms.linux;
  };
})
