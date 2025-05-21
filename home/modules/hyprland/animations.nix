{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.animations = {
    enabled = true;
    bezier = [ "easein, 0.36, 0, 0.66, -0.56" ];
    animation = [
      "windows, 1, 3, easein"
      "fade, 1, 3, easein"
      "workspaces, 1, 2, easein"
    ];
  };
}
