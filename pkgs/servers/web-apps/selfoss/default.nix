{ stdenv, fetchurl, unzip }:

stdenv.mkDerivation rec {
  name = "selfoss-${version}";
  version = "2.18";

  src = fetchurl {
    url = "https://github.com/SSilence/selfoss/releases/download/${version}/${name}.zip";
    sha256 = "1vd699r1kjc34n8avggckx2b0daj5rmgrj997sggjw2inaq4cg8b";
  };

  sourceRoot = ".";
  nativeBuildInputs = [ unzip ];

  installPhase = ''
    mkdir $out
    cp -ra * $out/
  '';

  meta = with stdenv.lib; {
    description = "Web-based news feed (RSS/Atom) aggregator";
    homepage = https://selfoss.aditu.de;
    license = licenses.gpl3;
    maintainers = with maintainers; [ jtojnar regnat ];
    platforms = platforms.all;
  };
}
