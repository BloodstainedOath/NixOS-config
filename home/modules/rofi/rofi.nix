{ config, pkgs, ... }:

{
  # Create the main rofi config file directly without using programs.rofi
  home.file.".config/rofi/config.rasi".text = ''
    configuration {
        modi:                       "drun,run";
        show-icons:                 true;
        display-drun:               "APPS";
        display-run:                "RUN";
        display-emoji:              "EMOJI";
        display-window:             "WINDOW";
        drun-display-format:        "{name}";
        window-format:              "{w} · {c} · {t}";
    }

    @theme "~/.config/rofi/colors.rasi"

    * {
        font:                            "Cinzel 12";
    }

    entry {
        placeholder: "Search";
    }

    mainbox {
        enabled:                     true;
        spacing:                     0px;
        background-color:            transparent;
        orientation:                 horizontal;
        children:                    [ "imagebox", "listbox" ];
    }

    imagebox {
        padding:                     20px;
        background-color:            transparent;
        background-image:            url("~/.config/rofi/images/rofi-bg.png", both);
        background-position:         center;
        background-repeat:           false;
        orientation:                 vertical;
        children:                    [ "inputbar", "dummy", "mode-switcher" ];
    }

    listbox {
        spacing:                     20px;
        padding:                     20px;
        background-color:            transparent;
        orientation:                 vertical;
        children:                    [ "message", "listview" ];
    }

    dummy {
        background-color:            transparent;
    }

    /*****----- Inputbar -----*****/
    inputbar {
        enabled:                     true;
        spacing:                     10px;
        padding:                     15px;
        border-radius:               10px;
        children:                    [ "textbox-prompt-colon", "entry" ];
    }

    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "";
        background-color:            inherit;
        text-color:                  inherit;
    }

    entry {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
        cursor:                      text;
        placeholder:                 "Search";
        placeholder-color:           inherit;
    }

    mode-switcher{
        enabled:                     true;
        spacing:                     20px;
        background-color:            transparent;
        text-color:                  @foreground;
    }

    button {
        padding:                     15px;
        border-radius:               10px;
        background-color:            @background;
        text-color:                  inherit;
        cursor:                      pointer;
    }

    button selected {
        background-color:            @active-background;
        text-color:                  @foreground;
    }

    listview {
        enabled:                     true;
        columns:                     1;
        lines:                       8;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;
        spacing:                     10px;
        background-color:            transparent;
        text-color:                  @foreground;
        cursor:                      "default";
    }

    element {
        enabled:                     true;
        spacing:                     15px;
        padding:                     8px;
        border-radius:               10px;
        background-color:            transparent;
        text-color:                  @foreground;
        cursor:                      pointer;
    }

    element normal.normal {
        background-color:            inherit;
        text-color:                  inherit;
    }

    element normal.urgent {
        background-color:            @background;
        text-color:                  @foreground;
    }

    element selected.urgent {
        background-color:            @background;
        text-color:                  @foreground;
    }

    element selected.active {
        background-color:            @background;
        text-color:                  @foreground;
    }

    element-icon {
        background-color:            transparent;
        text-color:                  inherit;
        size:                        32px;
        cursor:                      inherit;
    }

    element-text {
        background-color:            transparent;
        text-color:                  inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }

    message {
        background-color:            transparent;
    }

    textbox {
        padding:                     15px;
        border-radius:               10px;
        background-color:            @background;
        text-color:                  @foreground;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }

    error-message {
        padding:                     15px;
        border-radius:               20px;
        background-color:            @background;
        text-color:                  @foreground;
    }
  '';

  # Create the rofi images directory
  home.file.".config/rofi/images/.keep".text = "";
  
  # Create a launcher script
  home.file.".config/rofi/launcher.sh" = {
    text = ''
      #!/usr/bin/env bash
      dir="$HOME/.config/rofi"
      
      ## Run
      rofi \
          -show drun \
          -theme $dir/config.rasi
    '';
    executable = true;
  };
}