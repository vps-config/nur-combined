{
  config,
  lib,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    mkIf
    ;

  cfg = config.my.home.ssh;
in {
  options.my.home.ssh = {
    enable = (mkEnableOption "ssh configuration") // {default = true;};
  };

  config = mkIf cfg.enable {
    programs.ssh = {
      enable = true;

      matchBlocks = {
        boreal = {hostname = "boreal.alarsyo.net";};
        poseidon = {hostname = "poseidon.alarsyo.net";};
        pi = {
          hostname = "pi.alarsyo.net";
          user = "pi";
        };

        "*.lrde.epita.fr" = {
          user = "amartin";
        };

        lrde-proxyjump = {
          host = "*.lrde.epita.fr !ssh.lrde.epita.fr";
          proxyJump = "ssh.lrde.epita.fr";
        };
      };
    };
  };
}
