{ config, pkgs, ... }:

{
  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
      pkgs.xdg-desktop-portal-hyprland
      ];
      config.hyprland = {
        default = [ "wlr" "gtk" ];
      };
  };
  
}