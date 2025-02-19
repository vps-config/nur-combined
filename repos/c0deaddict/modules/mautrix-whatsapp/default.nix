{ lib, config, pkgs, ... }:

# https://github.com/NixOS/nixpkgs/pull/59211

with lib;

let
  cfg = config.services.mautrix-whatsapp;
  dataDir = "/var/lib/mautrix-whatsapp";
  format = pkgs.formats.json { };

  registrationFile = "${dataDir}/whatsapp-registration.yaml";
  settingsFile = format.generate "config.json" cfg.settings;
in {
  options.services.mautrix-whatsapp = {
    enable = mkEnableOption
      "Mautrix-whatsapp, a puppeting bridge between Matrix and WhatsApp.";

    settings = mkOption rec {
      apply = recursiveUpdate default;
      inherit (format) type;

      description = ''
        This options will be transform in YAML configuration file for the bridge

        Look <link xlink:href="https://github.com/tulir/mautrix-whatsapp/wiki/Bridge-setup">here</link> for documentation.
      '';
      default = {
        homeserver = {
          address = config.services.matrix-synapse.settings.public_baseurl;
          domain = config.services.matrix-synapse.settings.server_name;
        };
        appservice = rec {
          port = 29318;
          address = "http://localhost:${toString port}";
          hostname = "0.0.0.0";
          database = {
            type = "sqlite3";
            uri = "${dataDir}/mautrix-whatsapp.db";
          };
          id = "whatsapp";
          bot = {
            username = "whatsappbot";
            displayname = "WhatsApp Bot";
          };
          as_token = "";
          hs_token = "";
        };
        bridge = {
          username_template = "whatsapp_{{.}}";
          displayname_template =
            "{{if .Notify}}{{.Notify}}{{else}}{{.Jid}}{{end}}";
          command_prefix = "!wa";
          permissions."*" = "relaybot";
        };
        relaybot = {
          enabled = true;
          management = "!whatsappbot:${
              toString (config.services.matrix-synapse.settings.server_name)
            }";
        };
        logging = {
          directory = "${dataDir}/logs";
          file_name_format = "{{.Date}}-{{.Index}}.log";
          file_date_format = "2006-01-02";
          file_mode = 384;
          timestamp_format = "Jan _2, 2006 15:04:05";
          print_level = "info";
        };
      };
      example = {
        settings = {
          homeserver.address = "https://matrix.org";
          bridge.permissions = { "@example:matrix.org" = 100; };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.mautrix-whatsapp = {
      description = "Mautrix-WhatsApp Service - A WhatsApp bridge for Matrix";
      after = [ "network-online.target" "matrix-synapse.service" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];

      preStart = ''
        # generate the appservice's registration file if absent
        if [ ! -f '${registrationFile}' ]; then
          ${pkgs.mautrix-whatsapp}/bin/mautrix-whatsapp \
            --generate-registration \
            --config='${settingsFile}' \
            --registration='${registrationFile}'
        fi
        chmod 640 ${registrationFile}

        # substitute registration secrets into config file.
        ${pkgs.yq}/bin/yq -s '.[0].appservice.as_token = .[1].as_token
          | .[0].appservice.hs_token = .[1].hs_token
          | .[0]' ${settingsFile} ${registrationFile} \
          > ${dataDir}/config.yml
      '';

      serviceConfig = {
        Type = "simple";
        #DynamicUser = true;
        PrivateTmp = true;
        StateDirectory = baseNameOf dataDir;
        StateDirectoryMode = "0750";
        WorkingDirectory = "${dataDir}";

        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        User = "mautrix-whatsapp";
        Group = "matrix-synapse";
        SupplementaryGroups = "matrix-synapse";
        UMask = "027";
        Restart = "always";

        ExecStart = ''
          ${pkgs.mautrix-whatsapp}/bin/mautrix-whatsapp \
            --config='${dataDir}/config.yml' \
            --registration='${registrationFile}'
        '';
      };
    };

    users.users.mautrix-whatsapp = {
      isSystemUser = true;
      group = "mautrix-whatsapp";
      home = dataDir;
    };

    users.groups.mautrix-whatsapp = { };

    services.matrix-synapse.settings.app_service_config_files = [ registrationFile ];

  };
}
