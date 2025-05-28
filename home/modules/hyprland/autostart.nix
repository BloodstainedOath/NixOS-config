{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
    "waypaper --restore"
    "swww-daemon"
    "wl-paste --watch cliphist store"
    "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &"
  ];
}
