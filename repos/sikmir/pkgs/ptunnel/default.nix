{ stdenv, fetchurl, libpcap }:

stdenv.mkDerivation rec {
  pname = "ptunnel";
  version = "0.72";

  src = fetchurl {
    url = "https://www.cs.uit.no/~daniels/PingTunnel/PingTunnel-${version}.tar.gz";
    sha256 = "19076k3rjb6bfsdd8yzlf247vy84dziafm6hd5i8p4c8gnmgf65k";
  };

  buildInputs = [ libpcap ];

  makeFlags = [ "prefix=$(out)" ];

  meta = with stdenv.lib; {
    description = "A tool for reliably tunneling TCP connections over ICMP echo request and reply packets";
    homepage = "https://www.cs.uit.no/~daniels/PingTunnel";
    license = licenses.bsd3;
    maintainers = with maintainers; [ sikmir ];
    platforms = platforms.linux;
  };
}
