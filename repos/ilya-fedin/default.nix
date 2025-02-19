let
  nixpkgs = import (import ./flake-compat.nix).inputs.nixpkgs {};
in { pkgs ? nixpkgs }: let
  checkedPkgs = if (builtins.tryEval pkgs).success then pkgs else nixpkgs;
in with checkedPkgs; rec {
  modules = import ./modules;

  overlays = import ./overlays;

  ayatana-indicator-keyboard = callPackage ./pkgs/ayatana-indicator-keyboard {
    inherit cmake-extras libayatana-common;
  };

  ayatana-indicator-power = callPackage ./pkgs/ayatana-indicator-power {
    inherit cmake-extras libayatana-common;
  };

  cascadia-code-powerline = runCommand "cascadia-code-powerline" {} ''
    install -m644 --target $out/share/fonts/truetype -D ${cascadia-code}/share/fonts/truetype/CascadiaCodePL.ttf
    install -m644 --target $out/share/fonts/truetype -D ${cascadia-code}/share/fonts/truetype/CascadiaCodePLItalic.ttf
  '';

  cmake-extras = callPackage ./pkgs/cmake-extras {};

  exo2 = callPackage ./pkgs/exo2 {};

  gtk-layer-background = callPackage ./pkgs/gtk-layer-background {};

  # Qt 5.15 is not default on mac, tdesktop requires 5.15 (and kotatogram subsequently)
  kotatogram-desktop = libsForQt515.callPackage ./pkgs/kotatogram-desktop {
    inherit (darwin.apple_sdk.frameworks) Cocoa CoreFoundation CoreServices CoreText CoreGraphics
      CoreMedia OpenGL AudioUnit ApplicationServices Foundation AGL Security SystemConfiguration
      Carbon AudioToolbox VideoToolbox VideoDecodeAcceleration AVFoundation CoreAudio CoreVideo
      CoreMediaIO QuartzCore AppKit CoreWLAN WebKit IOKit GSS MediaPlayer IOSurface Metal MetalKit;

    # C++20 is required, darwin has Clang 7 by default, aarch64 has gcc 9 by default
    stdenv = if stdenv.isDarwin
      then llvmPackages_12.libcxxStdenv
      else if stdenv.isAarch64 then gcc10Stdenv else stdenv;

    # tdesktop has random crashes when jemalloc is built with gcc.
    # Apparently, it triggers some bug due to usage of gcc's builtin
    # functions like __builtin_ffsl by jemalloc when it's built with gcc.
    jemalloc = (jemalloc.override { stdenv = llvmPackages.stdenv; }).overrideAttrs(_: {
      doCheck = false;
    });

    abseil-cpp = abseil-cpp_202111;
  };

  kotatogram-desktop-with-webkit = callPackage ./pkgs/kotatogram-desktop/with-webkit.nix {
    inherit kotatogram-desktop;
  };

  libayatana-common = callPackage ./pkgs/libayatana-common {
    inherit cmake-extras;
  };

  mesa-drivers-amd = (pkgs.mesa.override {
  	galliumDrivers = [ "radeonsi" ];
  	driDrivers = [];
  	vulkanDrivers = [ "amd" ];
  	enableGalliumNine = false;
  	enableOSMesa = false;
  	enableOpenCL = false;
  }).drivers;

  mir = callPackage ./pkgs/mir {};

  mirco = callPackage ./pkgs/mirco {
    inherit mir;
  };

  nerd-fonts-symbols = callPackage ./pkgs/nerd-fonts-symbols {};

  qtgreet = libsForQt5.callPackage ./pkgs/qtgreet {
    inherit wlrootsqt;
  };

  silver = callPackage ./pkgs/silver {};

  ttf-croscore = noto-fonts.overrideAttrs(oldAttrs: {
    pname = "ttf-croscore";

    installPhase = ''
      install -m444 -Dt $out/share/fonts/truetype/croscore hinted/{Arimo,Cousine,Tinos}/*.ttf
    '';

    meta = oldAttrs.meta // {
      description = "Chrome OS core fonts";
      longDescription = "This package includes the Arimo, Cousine, and Tinos fonts.";
    };
  });

  virtualboxWithExtpack = virtualbox.override {
    enableHardening = true;
    extensionPack = virtualboxExtpack;
  };

  #wlcs = callPackage ./pkgs/wlcs {};

  wlrootsqt = libsForQt5.callPackage ./pkgs/wlrootsqt {};
}
