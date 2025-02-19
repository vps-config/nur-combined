{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.services.dbus-broker;

  brokerPkg = pkgs.dbus-broker.overrideAttrs(oldAttrs: {
    patches = (
      if attrsets.hasAttrByPath [ "patches" ] oldAttrs
      then oldAttrs.patches
      else []
    ) ++ [
      ./use-right-paths.patch
    ];

    doCheck = false;
  });
in {
  options = {
    services.dbus-broker = {
      enable = mkOption {
        type = types.bool;
        default = false;
        internal = true;
        description = ''
          Replace D-Bus message bus daemon with Linux D-Bus Message Broker, which is
          an implementation of a message bus as defined by the D-Bus specification.
          Its aim is to provide high performance and reliability, while keeping
          compatibility to the D-Bus reference implementation. It is exclusively
          written for Linux systems, and makes use of many modern features provided
          by recent linux kernel releases.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ brokerPkg ];
    systemd.packages = [ brokerPkg ];

    services.dbus.enable = true;

    systemd.services.dbus-broker = {
      # Don't restart dbus-broker. Bad things tend to happen if we do.
      reloadIfChanged = true;
      restartTriggers = [ config.environment.etc."dbus-1".source ];
      environment = { LD_LIBRARY_PATH = config.system.nssModules.path; };
      aliases = [ "dbus.service" ];
    };

    systemd.user.services.dbus-broker = {
      # Don't restart dbus-broker. Bad things tend to happen if we do.
      reloadIfChanged = true;
      restartTriggers = [ config.environment.etc."dbus-1".source ];
      aliases = [ "dbus.service" ];
    };
  };
}
