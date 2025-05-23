{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland; # Use wayland version for Hyprland
    
    # Terminal for rofi to use
    terminal = "${pkgs.kitty}/bin/kitty";
    
    # Basic configuration
    extraConfig = {
      # Display settings
      show-icons = true;
      icon-theme = "BeautySolar";
      display-drun = " Apps";
      display-run = " Run";
      display-window = " Windows";
      display-ssh = " SSH";
      display-combi = " All";
      
      # Behavior
      drun-display-format = "{name}";
      window-format = "{w} {c} {t}";
      matching = "fuzzy";
      sort = true;
      sorting-method = "fzf";
      case-sensitive = false;
      cycle = true;
      
      # Layout
      columns = 1;
      lines = 10;
      fixed-num-lines = false;
      
      # Keybindings
      kb-cancel = "Escape,Control+c";
      kb-accept-entry = "Return,KP_Enter";
      kb-remove-to-eol = "Control+k";
      kb-mode-next = "Tab";
      kb-mode-previous = "ISO_Left_Tab";
      kb-row-up = "Up,Control+p";
      kb-row-down = "Down,Control+n";
    };
  };

  # Rofi theme configuration
  home.file = {
    # Main rofi configuration directory
    ".config/rofi/config.rasi".text = ''
      configuration {
        @import "colors.rasi"
        
        font: "JetBrains Mono 12";
        modi: "drun,run,window,ssh,combi";
        combi-modi: "drun,run";
        
        /* Window settings */
        width: 600;
        
        /* Behavior */
        show-icons: true;
        terminal: "kitty";
        ssh-client: "ssh";
        ssh-command: "{terminal} -e {ssh-client} {host} [-p {port}]";
        run-command: "{cmd}";
        run-list-command: "";
        run-shell-command: "{terminal} -e {cmd}";
        
        /* Matching */
        matching: "fuzzy";
        case-sensitive: false;
        
        /* History and Sorting */
        disable-history: false;
        sort: true;
        sorting-method: "fzf";
        
        /* Display */
        drun-display-format: "{name}";
        window-format: "{w} {c} {t}";
      }
    '';

    # Custom theme that uses wallust colors
    ".config/rofi/theme.rasi".text = ''
      @import "colors.rasi"

      * {
        background-color: transparent;
        text-color: @foreground;
        
        margin: 0;
        padding: 0;
        spacing: 0;
      }

      window {
        location: center;
        width: 600px;
        border-radius: 12px;
        background-color: @background;
        border: 2px solid @bordercolor;
        padding: 10px;
      }

      mainbox {
        padding: 10px;
        spacing: 10px;
      }

      inputbar {
        background-color: @selected-background;
        border-radius: 8px;
        padding: 12px 16px;
        spacing: 8px;
        children: [prompt, textbox-prompt-colon, entry];
      }

      prompt {
        text-color: @active-background;
        font: "JetBrains Mono Bold 12";
      }

      textbox-prompt-colon {
        expand: false;
        str: "";
        text-color: @foreground;
      }

      entry {
        placeholder: "Search...";
        placeholder-color: mix(@foreground, @background, 50%);
        cursor: pointer;
      }

      listview {
        lines: 10;
        columns: 1;
        fixed-height: false;
        spacing: 4px;
        scrollbar: true;
        padding: 8px 0px;
      }

      scrollbar {
        handle-width: 6px;
        handle-color: @selected-background;
        background-color: @background;
        border-radius: 3px;
        margin: 0px 4px;
      }

      element {
        padding: 10px 12px;
        border-radius: 8px;
        spacing: 10px;
        orientation: horizontal;
        children: [element-icon, element-text];
      }

      element normal.normal {
        background-color: transparent;
        text-color: @foreground;
      }

      element normal.urgent {
        background-color: @urgent-background;
        text-color: @foreground;
      }

      element normal.active {
        background-color: @active-background;
        text-color: @background;
      }

      element selected.normal {
        background-color: @selected-background;
        text-color: @foreground;
        border: 1px solid @active-background;
      }

      element selected.urgent {
        background-color: @selected-urgent-background;
        text-color: @foreground;
      }

      element selected.active {
        background-color: @selected-active-background;
        text-color: @background;
      }

      element-icon {
        size: 24px;
        vertical-align: 0.5;
      }

      element-text {
        vertical-align: 0.5;
        highlight: bold underline;
      }

      message {
        padding: 12px;
        border-radius: 8px;
        background-color: @selected-background;
      }

      textbox {
        padding: 8px 12px;
        text-color: @foreground;
      }

      mode-switcher {
        spacing: 0;
        margin: 10px 0px 0px 0px;
      }

      button {
        padding: 10px 16px;
        border-radius: 6px;
        background-color: @selected-background;
        text-color: @foreground;
        horizontal-align: 0.5;
      }

      button selected {
        background-color: @active-background;
        text-color: @background;
      }

      /* Error and loading states */
      error-message {
        padding: 12px;
        border-radius: 8px;
        background-color: @urgent-background;
        text-color: @foreground;
      }
    '';

    # Power menu theme
    ".config/rofi/powermenu.rasi".text = ''
      @import "colors.rasi"

      * {
        background-color: transparent;
        text-color: @foreground;
        font: "JetBrains Mono 14";
        margin: 0;
        padding: 0;
        spacing: 0;
      }

      window {
        location: center;
        anchor: center;
        width: 400px;
        background-color: @background;
        border: 2px solid @bordercolor;
        border-radius: 12px;
        padding: 20px;
      }

      mainbox {
        spacing: 20px;
        children: [message, listview];
      }

      message {
        background-color: transparent;
        text-color: @foreground;
        horizontal-align: 0.5;
      }

      textbox {
        text-color: @foreground;
        font: "JetBrains Mono Bold 16";
        horizontal-align: 0.5;
      }

      listview {
        columns: 4;
        lines: 1;
        spacing: 15px;
        cycle: true;
        dynamic: true;
        layout: horizontal;
      }

      element {
        background-color: @selected-background;
        text-color: @foreground;
        border-radius: 10px;
        padding: 25px 10px;
        horizontal-align: 0.5;
        vertical-align: 0.5;
      }

      element selected {
        background-color: @active-background;
        text-color: @background;
        border: 2px solid @foreground;
      }

      element-text {
        font: "JetBrains Mono Bold 12";
        horizontal-align: 0.5;
        vertical-align: 0.5;
      }
    '';

    # Network menu theme
    ".config/rofi/networkmenu.rasi".text = ''
      @import "colors.rasi"

      * {
        background-color: transparent;
        text-color: @foreground;
        margin: 0;
        padding: 0;
        spacing: 0;
      }

      window {
        location: northeast;
        anchor: northeast;
        x-offset: -20px;
        y-offset: 60px;
        width: 350px;
        background-color: @background;
        border: 2px solid @bordercolor;
        border-radius: 8px;
        padding: 10px;
      }

      mainbox {
        spacing: 10px;
      }

      inputbar {
        background-color: @selected-background;
        border-radius: 6px;
        padding: 8px 12px;
        children: [prompt, entry];
        spacing: 8px;
      }

      prompt {
        text-color: @active-background;
        font: "JetBrains Mono Bold 10";
      }

      entry {
        placeholder: "Search networks...";
        font: "JetBrains Mono 10";
      }

      listview {
        lines: 8;
        scrollbar: false;
        spacing: 2px;
      }

      element {
        padding: 8px 12px;
        border-radius: 4px;
        orientation: horizontal;
        children: [element-icon, element-text];
        spacing: 8px;
      }

      element selected {
        background-color: @selected-background;
        text-color: @foreground;
      }

      element-icon {
        size: 16px;
      }

      element-text {
        font: "JetBrains Mono 10";
      }
    '';
  };

  # Rofi scripts for additional functionality
  home.file = {
    # Power menu script
    ".local/bin/rofi-powermenu".text = ''
      #!/bin/bash
      
      # Power menu options
      shutdown=" Shutdown"
      reboot=" Restart"
      lock=" Lock"
      suspend=" Sleep"
      logout=" Logout"
      
      # Show menu
      chosen=$(echo -e "$shutdown\n$reboot\n$lock\n$suspend\n$logout" | rofi -dmenu -theme ~/.config/rofi/powermenu.rasi -p "Power Menu")
      
      case $chosen in
          $shutdown)
              systemctl poweroff
              ;;
          $reboot)
              systemctl reboot
              ;;
          $lock)
              hyprlock
              ;;
          $suspend)
              systemctl suspend
              ;;
          $logout)
              hyprctl dispatch exit
              ;;
      esac
    '';

    # Clipboard manager script
    ".local/bin/rofi-clipboard".text = ''
      #!/bin/bash
      
      # Get clipboard history (requires wl-clipboard and cliphist)
      if command -v cliphist &> /dev/null; then
          cliphist list | rofi -dmenu -theme ~/.config/rofi/theme.rasi -p "Clipboard" | cliphist decode | wl-copy
      else
          echo "cliphist not found. Install it for clipboard history."
          exit 1
      fi
    '';

    # Window switcher script
    ".local/bin/rofi-windows".text = ''
      #!/bin/bash
      
      # Enhanced window switcher
      rofi -show window -theme ~/.config/rofi/theme.rasi
    '';

    # File browser script
    ".local/bin/rofi-files".text = ''
      #!/bin/bash
      
      # Simple file browser
      cd "$HOME"
      
      while true; do
          choice=$(find . -maxdepth 1 -type d -not -path '*/\.*' | sed 's|^\./||' | sort | rofi -dmenu -theme ~/.config/rofi/theme.rasi -p "$(pwd)")
          
          if [ -z "$choice" ]; then
              break
          elif [ "$choice" = ".." ]; then
              cd ..
          elif [ -d "$choice" ]; then
              cd "$choice"
          fi
      done
    '';
  };

  # Make scripts executable
  home.activation.makeRofiScriptsExecutable = config.lib.dag.entryAfter ["writeBoundary"] ''
    chmod +x ~/.local/bin/rofi-powermenu
    chmod +x ~/.local/bin/rofi-clipboard  
    chmod +x ~/.local/bin/rofi-windows
    chmod +x ~/.local/bin/rofi-files
  '';
}