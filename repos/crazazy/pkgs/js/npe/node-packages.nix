# This file has been generated by node2nix 1.11.1. Do not edit!

{nodeEnv, fetchurl, fetchgit, nix-gitignore, stdenv, lib, globalBuildInputs ? []}:

let
  sources = {
    "merge-2.1.1" = {
      name = "merge";
      packageName = "merge";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/merge/-/merge-2.1.1.tgz";
        sha512 = "jz+Cfrg9GWOZbQAnDQ4hlVnQky+341Yk5ru8bZSe6sIDTCIg8n9i/u7hSQGSVOF3C7lH6mGtqjkiT9G4wFLL0w==";
      };
    };
    "minimist-1.2.6" = {
      name = "minimist";
      packageName = "minimist";
      version = "1.2.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimist/-/minimist-1.2.6.tgz";
        sha512 = "Jsjnk4bw3YJqYzbdyBiNsPWHPfO++UGG749Cxs6peCu5Xg4nrena6OVxOYxrQTqww0Jmwt+Ref8rggumkTLz9Q==";
      };
    };
    "steeltoe-1.0.1" = {
      name = "steeltoe";
      packageName = "steeltoe";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/steeltoe/-/steeltoe-1.0.1.tgz";
        sha512 = "beMo5ArN5bRczhwUkaFlJJ39oGNLYotLTHTUgzAK02HwkE2gGLOPPsUHL6qTAfQoyt4lpkLVohhNY+PkdZRa3Q==";
      };
    };
  };
  args = {
    name = "npe";
    packageName = "npe";
    version = "1.2.0";
    src = fetchurl { url = "https://registry.npmjs.org/npe/-/npe-1.2.0.tgz"; sha1 = "a54d78f868267de93ae822f33072fa5ed4e9d36f"; };
    dependencies = [
      sources."merge-2.1.1"
      sources."minimist-1.2.6"
      sources."steeltoe-1.0.1"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "Node Package Editor: a CLI for one-off inspection and editing of properties in package.json files.";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
in
{
  args = args;
  sources = sources;
  tarball = nodeEnv.buildNodeSourceDist args;
  package = nodeEnv.buildNodePackage args;
  shell = nodeEnv.buildNodeShell args;
  nodeDependencies = nodeEnv.buildNodeDependencies (lib.overrideExisting args {
    src = stdenv.mkDerivation {
      name = args.name + "-package-json";
      src = nix-gitignore.gitignoreSourcePure [
        "*"
        "!package.json"
        "!package-lock.json"
      ] args.src;
      dontBuild = true;
      installPhase = "mkdir -p $out; cp -r ./* $out;";
    };
  });
}
