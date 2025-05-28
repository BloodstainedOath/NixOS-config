{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
    "waypaper --restore"
    "swww-daemon"
    # "hyprctl setcursor Bibata-Rainbow-Modern 24"
    "wl-paste --watch cliphist store"
    "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &"
  ];
}
