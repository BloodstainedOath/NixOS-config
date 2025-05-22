{ stdenv, fetchFromGitHub, qt6, pkgs }:

{
  sddm-theme = stdenv.mkDerivation rec {
    pname = "sddm-theme";
    version = "1.0.1";
    name = "${pname}-${version}";

    dontBuild = true;
    dontWrapQtApps = true;

    src = fetchFromGitHub {
      owner = "BloodstainedOath";
      repo = "sddm-theme";
      rev = "2090db355cde117b181b27839737196ec14058d2";
      sha256 = "sha256-7LCwG9TkKtVh8kcAYOhVz+TcYEEJlE7GUrIjyE6cAVk=";
    };

    buildInputs = [
      qt6.qtbase
      qt6.qtdeclarative
      qt6.qt5compat
  ];

    installPhase = ''
      mkdir -p $out/share/sddm/themes/sddm-theme
      cp -aR $src/* $out/share/sddm/themes/sddm-theme
    '';
  };
}
