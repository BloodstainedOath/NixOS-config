{ config, pkgs, lib, ... }:

{
  # services.displayManager.sddm.package = sddm-qt6;

  # services.xserver.enable = true;
  services.displayManager.sddm.settings = {
  General = {
    LogLevel = "debug";
  };
};


  services.displayManager.sddm = {
    package = pkgs.kdePackages.sddm;
    enable = true;
    wayland.enable = true;
    theme = "sddm-theme";
  };
}
