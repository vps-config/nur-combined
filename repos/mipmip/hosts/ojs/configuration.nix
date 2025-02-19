{ config, pkgs, ... }:

let
  myCustomLayout = pkgs.writeText "xkb-layout" ''
    clear lock
    ! disable capslock
    ! remove Lock = Caps_Lock
  '';
in
  {
    imports = [
      ./hardware-configuration.nix
      ../../shared-configuration.nix
      ../../modules/base-minimal.nix
      ../../modules/common.nix
      ../../modules/common-pkg.nix
      ../../modules/dev-crystal.nix
      ../../modules/dev-quiqr.nix
      ../../modules/dev-technative.nix
      ../../modules/vim-large.nix
      ../../modules/workstation.nix
      ../../modules/docker.nix
      ../../modules/virtualbox.nix
      ../../modules/workstation-pkg.nix
      ../../modules/home-manager-global.nix
      ../../modules/texlive.nix
      ../../modules/fonts.nix
      ../../modules/st.nix
      ../../modules/terminal.nix
      ../../modules/office-communication.nix
      ../../modules/browser-firefox.nix
      ../../modules/browser-chrome.nix
      ../../modules/nfspiet.nix
      ../../modules/peripherals_hurwenen.nix
      ../../modules/nixos-utils.nix
      ../../modules/explore-pkg.nix
      ../../modules/hardware.nix
  ];


  networking.hosts = {
      "127.0.0.1" = [ "ojs" "localhost" ];
      "213.206.241.6" = [ "buwa.nl" "www.buwa.nl" ];
    };


  services.xserver.displayManager.sessionCommands = "${pkgs.xorg.xmodmap}/bin/xmodmap ${myCustomLayout}";

  networking.hostName = "ojs";
  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.

  networking.useDHCP = false;
  networking.interfaces.enp10s0.useDHCP = true;
  networking.interfaces.enp9s0.useDHCP = true;
  networking.interfaces.wlp0s29f7u5.useDHCP = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #KEYCHRON KEYBOARD SWAP FN KEY
  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
  '';
  boot.kernelModules = [ "hid-apple"  ];

  #NIEUWE POGING
  boot.kernelParams = [
    "hid_apple.fnmode=2"
  ];


  system.stateVersion = "21.11"; # Did you read the comment?
}
