# This file has been generated by node2nix 1.11.1. Do not edit!
{
  nodeEnv,
  fetchurl,
  fetchgit,
  nix-gitignore,
  stdenv,
  lib,
  globalBuildInputs ? [],
}: let
  sources = {
    "@emmetio/abbreviation-2.2.3" = {
      name = "_at_emmetio_slash_abbreviation";
      packageName = "@emmetio/abbreviation";
      version = "2.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/@emmetio/abbreviation/-/abbreviation-2.2.3.tgz";
        sha512 = "87pltuCPt99aL+y9xS6GPZ+Wmmyhll2WXH73gG/xpGcQ84DRnptBsI2r0BeIQ0EB/SQTOe2ANPqFqj3Rj5FOGA==";
      };
    };
    "@emmetio/css-abbreviation-2.1.4" = {
      name = "_at_emmetio_slash_css-abbreviation";
      packageName = "@emmetio/css-abbreviation";
      version = "2.1.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@emmetio/css-abbreviation/-/css-abbreviation-2.1.4.tgz";
        sha512 = "qk9L60Y+uRtM5CPbB0y+QNl/1XKE09mSO+AhhSauIfr2YOx/ta3NJw2d8RtCFxgzHeRqFRr8jgyzThbu+MZ4Uw==";
      };
    };
    "@emmetio/scanner-1.0.0" = {
      name = "_at_emmetio_slash_scanner";
      packageName = "@emmetio/scanner";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@emmetio/scanner/-/scanner-1.0.0.tgz";
        sha512 = "8HqW8EVqjnCmWXVpqAOZf+EGESdkR27odcMMMGefgKXtar00SoYNSryGv//TELI4T3QFsECo78p+0lmalk/CFA==";
      };
    };
    "@types/node-17.0.45" = {
      name = "_at_types_slash_node";
      packageName = "@types/node";
      version = "17.0.45";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/node/-/node-17.0.45.tgz";
        sha512 = "w+tIMs3rq2afQdsPJlODhoUEKzFP1ayaoyl1CcnwtIlsVe7K7bA1NGm4s3PraqTLlXnbIN84zuBlxBWo1u9BLw==";
      };
    };
    "emmet-2.3.6" = {
      name = "emmet";
      packageName = "emmet";
      version = "2.3.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/emmet/-/emmet-2.3.6.tgz";
        sha512 = "pLS4PBPDdxuUAmw7Me7+TcHbykTsBKN/S9XJbUOMFQrNv9MoshzyMFK/R57JBm94/6HSL4vHnDeEmxlC82NQ4A==";
      };
    };
    "typescript-4.8.4" = {
      name = "typescript";
      packageName = "typescript";
      version = "4.8.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/typescript/-/typescript-4.8.4.tgz";
        sha512 = "QCh+85mCy+h0IGff8r5XWzOVSbBO+KfeYrMQh7NJ58QujwcE22u+NUSmUxqF+un70P9GXKxa2HCNiTTMJknyjQ==";
      };
    };
    "vscode-jsonrpc-6.0.0" = {
      name = "vscode-jsonrpc";
      packageName = "vscode-jsonrpc";
      version = "6.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-jsonrpc/-/vscode-jsonrpc-6.0.0.tgz";
        sha512 = "wnJA4BnEjOSyFMvjZdpiOwhSq9uDoK8e/kpRJDTaMYzwlkrhG1fwDIZI94CLsLzlCK5cIbMMtFlJlfR57Lavmg==";
      };
    };
    "vscode-languageserver-7.0.0" = {
      name = "vscode-languageserver";
      packageName = "vscode-languageserver";
      version = "7.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver/-/vscode-languageserver-7.0.0.tgz";
        sha512 = "60HTx5ID+fLRcgdHfmz0LDZAXYEV68fzwG0JWwEPBode9NuMYTIxuYXPg4ngO8i8+Ou0lM7y6GzaYWbiDL0drw==";
      };
    };
    "vscode-languageserver-protocol-3.16.0" = {
      name = "vscode-languageserver-protocol";
      packageName = "vscode-languageserver-protocol";
      version = "3.16.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-protocol/-/vscode-languageserver-protocol-3.16.0.tgz";
        sha512 = "sdeUoAawceQdgIfTI+sdcwkiK2KU+2cbEYA0agzM2uqaUy2UpnnGHtWTHVEtS0ES4zHU0eMFRGN+oQgDxlD66A==";
      };
    };
    "vscode-languageserver-textdocument-1.0.7" = {
      name = "vscode-languageserver-textdocument";
      packageName = "vscode-languageserver-textdocument";
      version = "1.0.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-textdocument/-/vscode-languageserver-textdocument-1.0.7.tgz";
        sha512 = "bFJH7UQxlXT8kKeyiyu41r22jCZXG8kuuVVA33OEJn1diWOZK5n8zBSPZFHVBOu8kXZ6h0LIRhf5UnCo61J4Hg==";
      };
    };
    "vscode-languageserver-types-3.16.0" = {
      name = "vscode-languageserver-types";
      packageName = "vscode-languageserver-types";
      version = "3.16.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-types/-/vscode-languageserver-types-3.16.0.tgz";
        sha512 = "k8luDIWJWyenLc5ToFQQMaSrqCHiLwyKPHKPQZ5zz21vM+vIVUSvsRpcbiECH4WR88K2XZqc4ScRcZ7nk/jbeA==";
      };
    };
  };
in {
  "@tailwindcss/language-server" = nodeEnv.buildNodePackage {
    name = "_at_tailwindcss_slash_language-server";
    packageName = "@tailwindcss/language-server";
    version = "0.0.9";
    src = fetchurl {
      url = "https://registry.npmjs.org/@tailwindcss/language-server/-/language-server-0.0.9.tgz";
      sha512 = "x0rvJkO8TmwhJWjBH7z4Qn1SLaaYYtvY8Liw5SnMX62u6QuNZ0R0XU9P7nVQg+x0rxakC8oQgS2+wfYRNUyHgQ==";
    };
    buildInputs = globalBuildInputs;
    meta = {
      description = "Tailwind CSS Language Server";
      homepage = "https://github.com/tailwindlabs/tailwindcss-intellisense/tree/HEAD/packages/tailwindcss-language-server#readme";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
  emmet-ls = nodeEnv.buildNodePackage {
    name = "emmet-ls";
    packageName = "emmet-ls";
    version = "0.3.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/emmet-ls/-/emmet-ls-0.3.0.tgz";
      sha512 = "dMwzSnRAcsxXbdMw9IWkr19mN1wnq7aKRtDEj5cJV+A2RKfi7cG04sPBKywYT7lbZPdc+GAk50cETOiNTJZ9hQ==";
    };
    dependencies = [
      sources."@emmetio/abbreviation-2.2.3"
      sources."@emmetio/css-abbreviation-2.1.4"
      sources."@emmetio/scanner-1.0.0"
      sources."@types/node-17.0.45"
      sources."emmet-2.3.6"
      sources."typescript-4.8.4"
      sources."vscode-jsonrpc-6.0.0"
      sources."vscode-languageserver-7.0.0"
      sources."vscode-languageserver-protocol-3.16.0"
      sources."vscode-languageserver-textdocument-1.0.7"
      sources."vscode-languageserver-types-3.16.0"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "emmet support by LSP";
      homepage = "https://github.com/aca/emmet-ls#readme";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
}
