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
      rev = "f9698fc5527830bdec4b3ef74984ba080f5b0f5b";
      sha256 = "sha256-lQtG+k24saWEKYzcStruzfD+auEofXGFkWnNZca1Y1Q=";
    };

    buildInputs = [
  qt6.qtbase
  qt6.qtdeclarative
  qt6.qt5compat
  pkgs.qt6Packages.sddm
];

    installPhase = ''
      mkdir -p $out/share/sddm/themes/sddm-theme
      cp -aR $src/* $out/share/sddm/themes/sddm-theme
    '';
  };
}
