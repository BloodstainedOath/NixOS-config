{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      # Define eldritch bezier curves inspired by dark souls
      bezier = [
        # === CURSED ESSENCE CURVES ===
        "cursed, 0.25, 0.46, 0.45, 0.94"      # Dark magic essence
        "hollow, 0.55, 0.085, 0.68, 0.53"     # Hollow, empty souls
        "corrupt, 0.68, -0.55, 0.265, 1.55"   # Corruption spreading
        "tainted, 0.23, 1, 0.32, 1"           # Tainted by darkness
        "void, 0.16, 1, 0.3, 1"               # Abyssal void magic
        
        # === BLOOD & BONE MAGIC ===
        "blood, 0.215, 0.61, 0.355, 1"        # Blood magic manifestation
        "bone, 0.25, 0.1, 0.25, 1"            # Skeletal precision
        "flesh, 0.4, 0, 0.2, 1"               # Flesh magic corruption
        "decay, 0.7, 0, 0.2, 1"               # Rotting, decaying
        "visceral, 0.6, 0.04, 0.98, 0.335"    # Visceral, brutal magic
        
        # === ELDRITCH HORRORS ===
        "eldritch, 0.68, -0.6, 0.32, 1.6"     # Cosmic horror with unease
        "madness, 0.175, 0.885, 0.32, 1.275"  # Sanity-breaking curves
        "nightmare, 0.77, 0, 0.175, 1"        # Nightmarish transitions
        "terror, 0.25, 0.8, 0.25, 1"          # Creeping terror
        "dread, 0.6, 0.04, 0.98, 0.335"       # Building dread
        
        # === DARK COVENANT MAGIC ===
        "covenant, 0.445, 0.05, 0.55, 0.95"   # Dark covenant rituals
        "hex, 0.55, 0.055, 0.675, 0.19"       # Hexing curses
        "blight, 0.165, 0.84, 0.44, 1"        # Spreading blight
        "plague, 0.25, 0.46, 0.45, 0.94"      # Plague magic
        "curse, 0.68, -0.55, 0.265, 1.55"     # Cursed transformations
        
        # === SOULS & SPIRITS ===
        "soul, 0.23, 1, 0.320, 1"             # Soul manipulation
        "spirit, 0.4, 0, 0.6, 1"              # Restless spirits
        "wraith, 0.7, 0, 0.2, 1"              # Wraith-like movement
        "specter, 0.16, 1, 0.3, 1"            # Spectral apparitions
        "phantom, 0.175, 0.885, 0.32, 1.275"  # Phantom manifestations
        
        # === DARK LORDS & BOSSES ===
        "lord, 0.68, -0.6, 0.32, 1.6"         # Dark lord power
        "boss, 0.25, 0.46, 0.45, 0.94"        # Boss-tier magic
        "champion, 0.215, 0.61, 0.355, 1"     # Champion abilities
        "knight, 0.25, 0.1, 0.25, 1"          # Dark knight precision
        "hunter, 0.4, 0, 0.6, 1"              # Blood hunter agility
        
        # === ANCIENT POWERS ===
        "ancient, 0.445, 0.05, 0.55, 0.95"    # Ancient one magic
        "primordial, 0.23, 1, 0.32, 1"        # Primordial forces
        "cosmic, 0.215, 0.61, 0.355, 1"       # Cosmic horror
        "abyss, 0.55, 0.085, 0.68, 0.53"      # Abyssal depths
        "eclipse, 0.68, -0.55, 0.265, 1.55"   # Solar eclipse power
        
        # === RITUAL MAGIC ===
        "ritual, 0.25, 0.46, 0.45, 0.94"      # Dark ritual casting
        "sacrifice, 0.6, 0.04, 0.98, 0.335"   # Blood sacrifice
        "summon, 0.68, -0.6, 0.32, 1.6"       # Summoning horrors
        "banish, 0.55, 0.085, 0.68, 0.53"     # Banishing to shadow realm
        "binding, 0.25, 0.1, 0.25, 1"         # Soul binding magic
        
        # === SPECIALIZED DARK EFFECTS ===
        "portal, 0.1, 0.9, 0.2, 1.02"         # Dark portals
        "miasma, 0.7, 0, 0.2, 1"              # Poisonous miasma
        "shadow, 0.4, 0, 0.6, 1"              # Living shadows
        "umbral, 0.68, -0.55, 0.265, 1.55"    # Umbral magic
        "linear, 0, 0, 1, 1"                   # For continuous dark energy
      ];
      
      animation = [
        # === GLOBAL DARK ENERGY ===
        "global, 1, 5, cursed"                 # All animations cursed
        
        # === WINDOW MANIFESTATION (Dark Souls) ===
        "windows, 1, 6, blood"                 # Windows bleed into reality
        "windowsIn, 1, 7, summon, popin 85%"   # Summoning from the abyss
        "windowsOut, 1, 5, banish, popin 60%"  # Banished to shadow realm
        "windowsMove, 1, 6, wraith"             # Wraith-like repositioning
        
        # === CURSED FADING EFFECTS ===
        "fade, 1, 6, hollow"                   # Hollowing fade
        "fadeIn, 1, 7, blood"                  # Bleeding into existence
        "fadeOut, 1, 5, decay"                 # Rotting away
        "fadeDim, 1, 4, shadow"                # Shadow realm dimming
        "fadeSwitch, 1, 6, corrupt"            # Corrupted transitions
        "fadeShadow, 1, 5, specter"            # Spectral shadows
        "fadeLayersIn, 1, 6, nightmare"        # Nightmarish layers
        "fadeLayersOut, 1, 4, phantom"         # Phantom disappearance
        
        # === ABYSSAL WORKSPACE TRAVEL ===
        "workspaces, 1, 7, portal, slide"      # Dark portal travel
        "specialWorkspace, 1, 6, abyss, slidevert" # Descend into abyss
        
        # === DARK UI MANIFESTATION ===
        "layers, 1, 6, miasma, fade"           # Poisonous UI miasma
        "layersIn, 1, 5, eldritch, slide"      # Eldritch UI emergence
        "layersOut, 1, 4, banish, fade"        # UI banished to void
        
        # === CURSED VISUAL EFFECTS ===
        "border, 1, 8, ritual"                 # Ritual circle borders
        "borderangle, 1, 12, linear, loop"     # Continuous dark energy flow
      ];
    };
  };
}