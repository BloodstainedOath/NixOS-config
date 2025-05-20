{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "Bibata_Cursor_Rainbow";
  version = "1.1.2";

  src = fetchFromGitHub {
    owner = "ful1e5";
    repo = "Bibata_Cursor_Rainbow";
    rev = "d83c20ee506c311e99a087db1b0d94b96463da13";
    sha256 = "sha256-nXimra1nMDpXEgBjYWkVCfVmYAZmMM/hy+orq2WAQZI=";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/icons/Bibata_Rainbow
    cp -r $src/* $out/share/icons/Bibata_Rainbow
  '';

}
