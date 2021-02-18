{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "infracost";
  version = "0.7.20";

  src = fetchFromGitHub {
    owner = "infracost";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-3r9OdVhrZtWm/yhgvlUXcdrq2/lIJ3cuYgB/tvuaFcU=";
  };

  vendorSha256 = "sha256-wdO+cv4EOLJir4dqG9Rvis7vIr68bKPHupWESc9hNtg=";

  subPackages = [ "cmd/infracost" ];

  buildFlagsArray = [
    "-ldflags="
    "-s"
    "-w"
    "-X github.com/infracost/${pname}/internal/version.Version=v${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Cloud cost estimates for Terraform in your CLI and pull requests";
    longDescription = ''
      Infracost shows hourly and monthly cost estimates for a Terraform project.
      This helps developers, DevOps et al. quickly see the cost breakdown and compare different deployment options upfront.
    '';
    homepage = "https://infracost.io";
    license = licenses.asl20;
    maintainers = with maintainers; [ jk ];
    platforms = platforms.all;
  };
}
