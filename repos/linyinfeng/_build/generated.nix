# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl }:
{
  clash-for-windows = {
    pname = "clash-for-windows";
    version = "0.17.0";
    src = fetchurl {
      sha256 = "12426cahnx0xaxir7flvfygwnd0rs0n5jqvqipwwyk4rfv0zvqfv";
      url = "https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.17.0/Clash.for.Windows-0.17.0-x64-linux.tar.gz";
    };

  };
  clash-for-windows-icon = {
    pname = "clash-for-windows-icon";
    version = "0";
    src = fetchurl {
      sha256 = "1zd453mwrlc9kafagyvmj9i8vd5a4akp9srbsy9mxa48x77ckqp2";
      url = "https://docs.cfw.lbyczf.com/favicon.ico";
    };

  };
  clash-premium-aarch64-linux = {
    pname = "clash-premium-aarch64-linux";
    version = "2021.07.03";
    src = fetchurl {
      sha256 = "14mk1n09lgsv704qwl43vlp214bvjiyhraynmly2knxhc0jvasa4";
      url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv8-2021.07.03.gz";
    };

  };
  clash-premium-i686-linux = {
    pname = "clash-premium-i686-linux";
    version = "2021.07.03";
    src = fetchurl {
      sha256 = "08aaafjzacdavpbgkgammp2ajfn58c0z7bv4ha6jmgpw2998wrfy";
      url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-386-2021.07.03.gz";
    };

  };
  clash-premium-x86_64-darwin = {
    pname = "clash-premium-x86_64-darwin";
    version = "2021.07.03";
    src = fetchurl {
      sha256 = "1csshjqgwl27w4v2pjsw7xl3y08paj5x5yg96hh3mfj4nhh5z0vs";
      url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-darwin-amd64-2021.07.03.gz";
    };

  };
  clash-premium-x86_64-linux = {
    pname = "clash-premium-x86_64-linux";
    version = "2021.07.03";
    src = fetchurl {
      sha256 = "1d6mq8qbkiz1f6fy91l2cdq32rk38kp479rf2ky73304a2rq2v9g";
      url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-2021.07.03.gz";
    };

  };
  dpt-rp1-py = {
    pname = "dpt-rp1-py";
    version = "v0.1.13";
    src = fetchgit {
      url = "https://github.com/janten/dpt-rp1-py";
      rev = "v0.1.13";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1jgkfn5kfnx98xs0dmym1h9mv1mrzlglk7x0fzs2jlc56c18w9dk";
    };

  };
  godns = {
    pname = "godns";
    version = "v2.5";
    src = fetchgit {
      url = "https://github.com/TimothyYe/godns";
      rev = "v2.5";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "11735nard9djfc4gbxnp2sc60aw9f6jkm2h9yvhm754abnchbbc9";
    };

  };
  trojan = {
    pname = "trojan";
    version = "v1.16.0";
    src = fetchgit {
      url = "https://github.com/trojan-gfw/trojan";
      rev = "v1.16.0";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0v24hy46vmbx4yjnf49w2ib5l893b19imykk86zbyj1sfh8ijakw";
    };

  };
  vlmcsd = {
    pname = "vlmcsd";
    version = "svn1113";
    src = fetchgit {
      url = "https://github.com/Wind4/vlmcsd";
      rev = "svn1113";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "19qfw4l4b5vi03vmv9g5i7j32nifvz8sfada04mxqkrqdqxarb1q";
    };

  };
}
