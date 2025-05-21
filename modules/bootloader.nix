{ config, pkgs, ... }:

let
  sekiroTheme = pkgs.fetchFromGitHub {
    owner = "semimqmo";
    repo = "sekiro_grub_theme";
    rev = "1affe05f7257b72b69404cfc0a60e88aa19f54a6";
    hash = "sha256-wTr5S/17uwQXkWwElqBKIV1J3QUP6W2Qx2Nw0SaM7Qk=";
  } + "/Sekiro";

  raidenTheme = pkgs.fetchFromGitHub {
    owner = "Dan1meR4ik-12";
    repo = "RaidenShogun-GRUB-Theme";
    rev = "440e8d056d71c71f1c83b5bd8b7d9a6655e0a678";
    hash = "sha256-0kxnJUIExNIi+YesIfrArrTuCYSV4H6vB8jJHu6LoXk=";
  } + "/RaidenShogun";

in
{
  boot.loader = {
    systemd-boot.enable = false;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";

      # ✨ Pick your favorite theme here
      theme = sekiroTheme;  # Change to sekiroTheme, wutheringTheme, etc.
    };

    efi.canTouchEfiVariables = true;
  };
}
