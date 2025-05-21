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
      rev = "4117b4688b460a2398482bcc5d485dc7abce27d7";
      sha256 = "sha256-pBsWWBFLnzTa7AEKOIF1mmlZXEGq6m9z4kiYMvLprw0=";
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
