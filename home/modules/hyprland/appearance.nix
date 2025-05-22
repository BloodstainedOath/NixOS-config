{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      "col.active_border" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
      "col.inactive_border" = "rgba(6c7086ff)";
      resize_on_border = true;
      hover_icon_on_border = true;
      layout = "master";

      # 🧷 Snap settings here
      snap = {
        enabled = true;
        window_gap = 8;       # Or 10 for default behavior
        monitor_gap = 8;      # Distance to screen edge
        border_overlap = true; # Tighter snapping
      };
    };

    decoration = {
      rounding = 8;
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        new_optimizations = true;
        vibrancy = 1;
        # vibrancy_darkness = 1;
        ignore_opacity = true;
        popups = true;
      };
      active_opacity = 1.0;
      inactive_opacity = 0.9;
      fullscreen_opacity = 1.0;
    };

    dwindle = {
      pseudotile = true;
      force_split = 2;
      preserve_split = true;
      special_scale_factor = 0.95;
    };

    master = {
        allow_small_split = true;        
        drop_at_cursor = true;        
        inherit_fullscreen = true;            
        new_on_top = false;       
        orientation = "right";        
        mfact = 0.55;        
        smart_resizing = true;        
        special_scale_factor = 0.8;
        new_status = "slave";
        };
  };
}
