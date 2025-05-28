{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    
    "$mainMod" = "SUPER";
    "$terminal" = "kitty";
    "$filemanager" = "nautilus";
    "$menu" = "$HOME/.config/rofi/launcher.sh";
    "$browser" = "firefox-devedition";
    "$codeEditor" = "codium";
    "$second_browser" = "Vivaldi-stable";

    bind = [
      # Window Management
      "$mainMod, Q, killactive"
      "$mainMod, M, exit"
      "$mainMod, F, fullscreen"
      "$mainMod SHIFT, F, togglefloating"

      # Group creation and management
      "$mainMod, G, togglegroup"
      "$mainMod SHIFT, G, lockactivegroup, toggle"  # Lock/unlock group
      "$mainMod CTRL, G, moveoutofgroup"            # Move window out of group

      # Group navigation
      "$mainMod, TAB, changegroupactive, f"         # Next tab in group
      "$mainMod SHIFT, TAB, changegroupactive, b"   # Previous tab in group
      "$mainMod, bracketright, changegroupactive, f"  # ] - Next tab
      "$mainMod, bracketleft, changegroupactive, b"   # [ - Previous tab

      # Focus And Movement
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # Windows Movement
      "$mainMod SHIFT, left, movewindow, l"
      "$mainMod SHIFT, right, movewindow, r"
      "$mainMod SHIFT, up, movewindow, u"
      "$mainMod SHIFT, down, movewindow, d"

      #######################
      ## WORKSPACE CONTROL ##
      #######################

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move active window to a workspace
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Scroll through workspaces
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      # Special workspaces
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      ##########################
      ### APPLICATION LAUNCH ###
      ##########################

      # Terminal and file management
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod, E, exec, $filemanager"

      # Launchers and menus
      "$mainMod, R, exec, wofi --show drun"
      "$mainMod CTRL, RETURN, exec, $menu"
      "$mainMod, L, exec, hyprlock"

      # Browsers and communication
      "$mainMod, B, exec, $browser"
      "$mainMod SHIFT, B, exec, $second_browser"
      "$mainMod, D, exec, vesktop"

      # Development and productivity
      "$mainMod SHIFT, V, exec, codium"

      # ScreenShot bindings
      # "$mainMod, Print, exec, flameshot full"
      # "$mainMod SHIFT, Print, exec, flameshot gui"
      # "$mainMod CTRL, Print, exec, flameshot screen"
      # "$mainMod CTRL SHIFT, Print, exec, flameshot full -c "


      "$mainMod, Print, exec, hyprshot -m output"
      "$mainMod SHIFT, Print, exec, hyprshot -m region"
      "$mainMod CTRL, Print, exec, hyprshot -m window"

      #############################
      ####  WALLPAPER CONTROLS ####
      #############################

      "$mainMod SHIFT, W, exec, waypaper --random"
      "$mainMod CTRL, W, exec, waypaper"


      ##############################
      ######## Custom Apps #########
      ##############################

      "$mainMod, H, exec, heroic"
      "$mainMod, U, exec, upscayl"
      "$mainMod, Y, exec, youtube-music"

      # Clipboard
      "$mainMod, V, exec, sh -c 'cliphist list | wofi -dmenu | cliphist decode | wl-copy'"
    ];

    #######################
    ### MULTIMEDIA KEYS ###
    #######################

    binde = [
      # Volume control with repeat
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

      # Brightness control with repeat
      ", XF86MonBrightnessUp, exec, brightnessctl set +2%"
      ", XF86MonBrightnessDown, exec, brightnessctl set 2%-"

      # Window resizing
      "$mainMod CTRL, left, resizeactive, -20 0"
      "$mainMod CTRL, right, resizeactive, 20 0"
      "$mainMod CTRL, up, resizeactive, 0 -20"
      "$mainMod CTRL, down, resizeactive, 0 20"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
