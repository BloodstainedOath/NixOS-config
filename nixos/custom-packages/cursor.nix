# Add this to your configuration.nix

{ pkgs, ... }:

let
  bibata-cursor-rainbow-modern = pkgs.stdenv.mkDerivation rec {
    pname = "bibata-cursor-rainbow-modern";
    version = "1.1.2";

    src = pkgs.fetchurl {
      url = "https://github.com/ful1e5/Bibata_Cursor_Rainbow/releases/download/v${version}/Bibata-Rainbow-Modern.tar.gz";
      sha256 = "sha256-nXimra1nMDpXEgBjYWkVCfVmYAZmMM/hy+orq2WAQZI=";
    };

    installPhase = ''
      mkdir -p $out/share/icons
      cp -r Bibata-Rainbow-Modern $out/share/icons/
    '';

    meta = with pkgs.lib; {
      description = "Bibata Rainbow Modern Cursor Theme";
      homepage = "https://github.com/ful1e5/Bibata_Cursor_Rainbow";
      license = licenses.gpl3;
      platforms = platforms.linux;
    };
  };
in
{
  environment.systemPackages = [ bibata-cursor-rainbow-modern ];
}
