{ lib
, buildPythonPackage
, isPy3k
, fetchFromGitHub
, colorama
, numpy
, oead
}:

buildPythonPackage rec {
  pname = "botw-havok";
  version = "0.3.18";
  disabled = !isPy3k;

  src = fetchFromGitHub {
    owner = "krenyy";
    repo = "botw_havok";
    rev = "dc7966c7780ef8c8a35e061cd3aacc20020fa2d7";
    sha256 = "1llnczbxl10l4crp1gjkbw096nvpz502zrh635f2vnbzibqfqikr";
  };

  patches = [
    ./loosen-requirements.patch
  ];

  propagatedBuildInputs = [
    colorama
    numpy
    oead
  ];

  # No tests
  doCheck = false;

  meta = with lib; {
    description = "A library for manipulating Breath of the Wild Havok packfiles";
    homepage = "https://github.com/krenyy/botw_havok";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ metadark ];
  };
}
