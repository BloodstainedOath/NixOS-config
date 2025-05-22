{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
    };

    decoration = {
      rounding = 10;
      blur = {
        enabled = true;
        size = 5;
        passes = 1;
      };
    };
  };
}
