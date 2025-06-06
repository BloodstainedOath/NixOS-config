{ config, pkgs, ... }:

{
  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk
      ];
      config.hyprland = {
        default = [ "wlr" "gtk" ];
      };
  };
  
}