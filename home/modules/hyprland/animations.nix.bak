{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      # Define mystical bezier curves inspired by arcane magic
      bezier = [
        # === ELEMENTAL ESSENCE CURVES ===
        "ethereal, 0.22, 1, 0.36, 1"          # Air - light, weightless movement
        "arcane, 0.25, 0.46, 0.45, 0.94"      # Pure magical energy
        "celestial, 0.23, 1, 0.32, 1"         # Heavenly, divine motion
        "shadow, 0.16, 1, 0.3, 1"             # Dark magic, stealthy
        "crystal, 0.25, 0.1, 0.25, 1"         # Sharp, crystalline precision
        
        # === MYSTICAL MANIFESTATION ===
        "manifest, 0.215, 0.61, 0.355, 1"     # Spells materializing
        "summon, 0.34, 1.56, 0.64, 1"         # Entities appearing with power
        "banish, 0.55, 0.085, 0.68, 0.53"     # Sending to other realms
        "teleport, 0.68, -0.55, 0.265, 1.55"  # Instant magical transport
        "phase, 0.4, 0, 0.2, 1"               # Phasing between dimensions
        
        # === ENCHANTED INTERACTIONS ===
        "enchant, 0.68, -0.6, 0.32, 1.6"      # Magical enhancement with bounce
        "bewitch, 0.175, 0.885, 0.32, 1.275"  # Mesmerizing charm
        "glamour, 0.77, 0, 0.175, 1"          # Illusion magic
        "charm, 0.25, 0.8, 0.25, 1"           # Gentle enchantment
        "hex, 0.6, 0.04, 0.98, 0.335"         # Dark curse magic
        
        # === ELEMENTAL FORCES ===
        "flame, 0.25, 0.46, 0.45, 0.94"       # Fire - flickering motion
        "frost, 0.23, 1, 0.320, 1"            # Ice - sharp, clean
        "storm, 0.68, -0.55, 0.265, 1.55"     # Lightning - explosive
        "earth, 0.55, 0.055, 0.675, 0.19"     # Stone - heavy, solid
        "wind, 0.165, 0.84, 0.44, 1"          # Air - flowing, gentle
        
        # === MYSTICAL CREATURES ===
        "dragon, 0.68, -0.6, 0.32, 1.6"       # Powerful, majestic
        "phoenix, 0.25, 0.46, 0.45, 0.94"     # Rising, rebirth
        "wisp, 0.4, 0, 0.6, 1"                # Forest spirits
        "wraith, 0.7, 0, 0.2, 1"              # Ghostly, haunting
        "fairy, 0.175, 0.885, 0.32, 1.275"    # Playful, light
        
        # === ANCIENT MAGIC ===
        "rune, 0.25, 0.1, 0.25, 1"            # Ancient symbols activating
        "ritual, 0.445, 0.05, 0.55, 0.95"     # Ceremonial magic
        "oracle, 0.23, 1, 0.32, 1"            # Prophetic visions
        "cosmic, 0.215, 0.61, 0.355, 1"       # Universal forces
        "void, 0.55, 0.085, 0.68, 0.53"       # Emptiness, dark magic
        
        # === SPECIALIZED EFFECTS ===
        "portal, 0.1, 0.9, 0.2, 1.02"         # Dimensional gateways
        "shimmer, 0.25, 0.46, 0.45, 0.94"     # Magical sparkle
        "pulse, 0.4, 0, 0.6, 1"               # Rhythmic magic
        "spiral, 0.68, -0.55, 0.265, 1.55"    # Swirling energy
        "linear, 0, 0, 1, 1"                   # For continuous loops
      ];
      
      animation = [
        # === GLOBAL MYSTICAL ENERGY ===
        "global, 1, 8, ethereal"               # Universal magical energy
        
        # === WINDOW MANIFESTATION (Core Magic) ===
        "windows, 1, 8, manifest"              # Windows appear through magic
        "windowsIn, 1, 9, summon, popin 80%"   # New windows summoned from void
        "windowsOut, 1, 7, banish, popin 70%"  # Windows banished to void  
        "windowsMove, 1, 8, teleport"          # Magical repositioning
        
        # === ETHEREAL FADING EFFECTS ===
        "fade, 1, 8, ethereal"                 # General ethereal fading
        "fadeIn, 1, 10, manifest"              # Materializing from ether
        "fadeOut, 1, 8, phase"                 # Phasing out of reality
        "fadeDim, 1, 6, shadow"                # Shadow magic dimming
        "fadeSwitch, 1, 9, enchant"            # Enchanted transitions
        "fadeShadow, 1, 7, wraith"             # Wraith-like shadows
        "fadeLayersIn, 1, 8, glamour"          # Illusory layers appearing
        "fadeLayersOut, 1, 6, wisp"            # Spirit-like disappearance
        
        # === DIMENSIONAL WORKSPACE MAGIC ===
        "workspaces, 1, 10, portal, slide"     # Portal slide between realms
        "specialWorkspace, 1, 9, dragon, slidevert" # Dragon's lair vertical access
        
        # === MYSTICAL UI LAYERS ===
        "layers, 1, 8, ethereal, fade"         # Ethereal layer magic with fade
        "layersIn, 1, 8, enchant, slide"       # Enchanted overlays sliding in
        "layersOut, 1, 6, banish, fade"        # Banishing overlays with fade
        
        # === VISUAL ENCHANTMENTS ===
        "border, 1, 12, rune"                  # Runic border magic
        "borderangle, 1, 20, linear, loop"     # Continuous mystical energy
      ];
    };
  };
}