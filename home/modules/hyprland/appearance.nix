{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      "col.active_border" = "$color2 $color4";
      "col.inactive_border" = "$color7";
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
        new_status = "master";
    };

    misc = {
      # font_family = "Cinzel";
      animate_manual_resizes = true;
      vfr = false;
    };

    env = [
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "LIBVA_DRIVER_NAME,nvidia"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "NVD_BACKEND,direct"
      "GBM_BACKEND,nvidia-drm"
    ];

    group = {
      # Group border colors
      "col.border_active" = "rgba(88c0d0ff)";      # Active group border (Nord blue)
      "col.border_inactive" = "rgba(4c566aff)";    # Inactive group border (Nord gray)
      "col.border_locked_active" = "rgba(d08770ff)"; # Locked active group (Nord orange)
      "col.border_locked_inactive" = "rgba(5e81acff)"; # Locked inactive group
      
      # Groupbar (tab bar) styling
      groupbar = {
        enabled = true;
        font_family = "JetBrains Mono";            # Your preferred font
        font_size = 10;
        gradients = false;
        height = 20;
        priority = 3;
        render_titles = true;
        scrolling = true;
        text_color = "rgba(eceff4ff)";             # Text color (Nord white)
        
        # Tab colors
        "col.active" = "rgba(5e81acff)";           # Active tab background
        "col.inactive" = "rgba(3b4252ff)";         # Inactive tab background
        "col.locked_active" = "rgba(d08770ff)";    # Locked active tab
        "col.locked_inactive" = "rgba(4c566aff)";  # Locked inactive tab
      };
  };
};
}
