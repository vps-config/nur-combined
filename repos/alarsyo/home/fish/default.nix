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

  cfg = config.my.home.fish;
in {
  options.my.home.fish.enable = (mkEnableOption "Fish shell") // {default = true;};

  config = mkIf cfg.enable {
    home.sessionVariables = {
      # automatically prompt to run program in nix-shell if it's not installed
      NIX_AUTO_RUN = "1";
      NIX_AUTO_RUN_INTERACTIVE = "1";
    };

    programs.fish = {
      enable = true;
    };

    xdg.configFile."fish/functions" = {source = ./. + "/functions";};
  };
}
