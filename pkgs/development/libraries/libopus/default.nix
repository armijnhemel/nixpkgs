{ stdenv, fetchurl, fetchpatch
, fixedPoint ? false, withCustomModes ? true }:

let
  version = "1.1.3";
in
stdenv.mkDerivation rec {
  name = "libopus-${version}";

  src = fetchurl {
    url = "http://downloads.xiph.org/releases/opus/opus-${version}.tar.gz";
    sha256 = "0cxnd7pjxbgh6l3cbzsw29phpr5cq28fikfhjlp1hc3y5s0gxdjq";
  };

  patches = [
    (fetchpatch { # CVE-2017-0381
      url = "https://github.com/xiph/opus/commit/79e8f527b0344b0897a65be35e77f7885bd99409.patch";
      sha256 = "0clm4ixqkaj0a6i5rhaqfv3nnxyk33b2b8xlm7vyfd0y8kbh996q";
    })
  ];

  outputs = [ "out" "dev" ];

  configureFlags = stdenv.lib.optional fixedPoint "--enable-fixed-point"
                ++ stdenv.lib.optional withCustomModes "--enable-custom-modes";

  doCheck = true;

  meta = with stdenv.lib; {
    description = "Open, royalty-free, highly versatile audio codec";
    license = stdenv.lib.licenses.bsd3;
    homepage = http://www.opus-codec.org/;
    platforms = platforms.unix;
    maintainers = with maintainers; [ wkennington ];
  };
}
