{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      # Define all your bezier curves (removed bouncy ones)
      bezier = [
        # Practical/Modern animations (no bounce)
        "fastIn, 0.7, 0, 0.84, 0"               # fast snap-in
        "subtleOut, 0.2, 0.8, 0.2, 1"           # elegant fade-out
        "elegant, 0.2, 0.8, 0.2, 1"             # elegant curve
        "modernEase, 0.25, 0.1, 0.25, 1"        # CSS ease curve
        "modernSlide, 0.16, 1, 0.3, 1"          # Smooth slide effect
        "modernFade, 0.25, 0.46, 0.45, 0.94"    # Modern fade
        "smoothOut, 0.36, 0, 0.66, -0.56"       # Smooth exit with reverse
        "smoothIn, 0.25, 1, 0.5, 1"             # Smooth entrance
        "snappy, 0.4, 0, 0.2, 1"                # Snappy response
        "linear, 0, 0, 1, 1"                    # Linear timing
        "borderColor, 0.3, 0.7, 0.4, 1.0"       # Border color transitions
        "popupBezier, 0.1, 0.9, 0.1, 1.05"      # Popup animation curve - quick appearance with slight bounce
        
        # Fantasy/Mystical animations
        "mystical, 0.25, 0.46, 0.45, 0.94"      # Smooth mystical fade
        "ethereal, 0.22, 1, 0.36, 1"            # Light and airy
        "dreamlike, 0.19, 1, 0.22, 1"           # Dreamy floating effect
        "enchanted, 0.25, 0.8, 0.25, 1"         # Gentle magic flow
        "spellcast, 0.23, 1, 0.32, 1"           # Like casting a spell
        "ghostly, 0.16, 1, 0.3, 1"              # Ghostly appearance
        "smoothMagic, 0.4, 0, 0.2, 1"           # Smooth magical flow
        "fadein, 0.25, 0.46, 0.45, 0.94"        # Elegant magical fade
        "manifest, 0.215, 0.61, 0.355, 1"       # Smooth manifestation
        "wisp, 0.25, 0.46, 0.45, 0.94"
      ];

      animation = [
        # === WINDOW ANIMATIONS ===
        # Main window lifecycle
        "windows, 1, 6, ethereal"                # Window open/close - light and airy
        "windowsIn, 1, 7, manifest"              # Window appearing - smooth manifestation
        "windowsOut, 1, 4, wisp"                 # Window disappearing - like smoke
        "windowsMove, 1, 5, dreamlike"           # Window moving - dreamy float

        # === FADE ANIMATIONS ===
        # General fading effects
        "fade, 1, 6, mystical"                   # General fade - mystical
        "fadeIn, 1, 7, fadein"                   # Fade in - elegant magical
        "fadeOut, 1, 6, smoothOut"               # Fade out - smooth exit
        "fadeDim, 1, 5, elegant"                 # Dim fade - elegant
        "fadeSwitch, 1, 7, enchanted"            # Switch fade - gentle magic
        "fadeShadow, 1, 6, ghostly"              # Shadow fade - ghostly
        "fadeLayersIn, 1, 5, ethereal"           # Layer fade in - airy
        "fadeLayersOut, 1, 4, wisp"              # Layer fade out - wisp-like
        
        # === WORKSPACE ANIMATIONS ===
        # Workspace transitions
        "workspaces, 1, 7, modernSlide"           # Workspace switching - smooth slide
        "specialWorkspace, 1, 6, dreamlike"        # Special workspace - dreamy

        # === LAYER ANIMATIONS ===
        # Overlay and UI layers
        "layers, 1, 6, ethereal"                 # Layer animations - light
        "layersIn, 1, 5, manifest"               # Layer appearing - manifestation
        "layersOut, 1, 4, ghostly"               # Layer disappearing - ghostly

        # === BORDER ANIMATIONS ===
        # Border effects
        "border, 1, 10, borderColor"             # Border color - smooth transition
        "borderangle, 1, 8, linear, loop"             # Border angle - linear
      ];
    };
  };
}