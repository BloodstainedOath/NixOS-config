{ config, pkgs, lib, ... }:

{
  # services.displayManager.sddm.package = sddm-qt6;

  # services.xserver.enable = true;
  services.displayManager.sddm.settings = {
  General = {
    LogLevel = "debug";
  };
  X11 = {
        CursorTheme = "Bibata-Rainbow-Modern";
        CursorSize = 24;
      };
};


  services.displayManager.sddm = {
    package = pkgs.kdePackages.sddm;
    enable = true;
    wayland.enable = true;
    theme = "sddm-theme";
  };
}
