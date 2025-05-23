{ config, pkgs, ... }:

{
  programs.wallust = {
    enable = true;
    settings = {
      backend = "full";
      color_space = "lch";
      threshold = 5;
      check_contrast = true;
      
      templates = {
        # Hyprland colors
        hyprland = {
          template = "hyprland.conf";
          target = "~/.config/hypr/colors.conf";
        };
        
        # Waybar colors
        waybar = {
          template = "waybar.css";
          target = "~/.config/waybar/colors.css";
        };
        
        # Kitty terminal colors
        kitty = {
          template = "kitty.conf";
          target = "~/.config/kitty/colors.conf";
        };
        
        # Rofi colors
        rofi = {
          template = "rofi.rasi";
          target = "~/.config/rofi/colors.rasi";
        };
      };
    };
  };

  # Create template files
  home.file = {
    # Hyprland color template
    ".config/wallust/templates/hyprland.conf".text = ''
      $background = rgb({{background | strip}})
      $foreground = rgb({{foreground | strip}})
      $color0 = rgb({{color0 | strip}})
      $color1 = rgb({{color1 | strip}})
      $color2 = rgb({{color2 | strip}})
      $color3 = rgb({{color3 | strip}})
      $color4 = rgb({{color4 | strip}})
      $color5 = rgb({{color5 | strip}})
      $color6 = rgb({{color6 | strip}})
      $color7 = rgb({{color7 | strip}})
      $color8 = rgb({{color8 | strip}})
      $color9 = rgb({{color9 | strip}})
      $color10 = rgb({{color10 | strip}})
      $color11 = rgb({{color11 | strip}})
      $color12 = rgb({{color12 | strip}})
      $color13 = rgb({{color13 | strip}})
      $color14 = rgb({{color14 | strip}})
      $color15 = rgb({{color15 | strip}})
    '';

    # Waybar color template - FIXED with proper validation
    ".config/wallust/templates/waybar.css".text = ''
      @define-color background {{background | default("#1e1e2e")}};
      @define-color foreground {{foreground | default("#cdd6f4")}};
      @define-color cursor {{cursor | default(foreground)}};
      @define-color color0 {{color0 | default("#45475a")}};
      @define-color color1 {{color1 | default("#f38ba8")}};
      @define-color color2 {{color2 | default("#a6e3a1")}};
      @define-color color3 {{color3 | default("#f9e2af")}};
      @define-color color4 {{color4 | default("#89b4fa")}};
      @define-color color5 {{color5 | default("#f5c2e7")}};
      @define-color color6 {{color6 | default("#94e2d5")}};
      @define-color color7 {{color7 | default("#bac2de")}};
      @define-color color8 {{color8 | default("#585b70")}};
      @define-color color9 {{color9 | default("#f38ba8")}};
      @define-color color10 {{color10 | default("#a6e3a1")}};
      @define-color color11 {{color11 | default("#f9e2af")}};
      @define-color color12 {{color12 | default("#89b4fa")}};
      @define-color color13 {{color13 | default("#f5c2e7")}};
      @define-color color14 {{color14 | default("#94e2d5")}};
      @define-color color15 {{color15 | default("#a6adc8")}};
    '';

    # Kitty color template
    ".config/wallust/templates/kitty.conf".text = ''
      foreground {{foreground}}
      background {{background}}
      selection_foreground {{foreground}}
      selection_background {{color8}}
      
      color0  {{color0}}
      color1  {{color1}}
      color2  {{color2}}
      color3  {{color3}}
      color4  {{color4}}
      color5  {{color5}}
      color6  {{color6}}
      color7  {{color7}}
      color8  {{color8}}
      color9  {{color9}}
      color10 {{color10}}
      color11 {{color11}}
      color12 {{color12}}
      color13 {{color13}}
      color14 {{color14}}
      color15 {{color15}}
    '';

    # Rofi color template
    ".config/wallust/templates/rofi.rasi".text = ''
      * {
        active-background: {{color2}};
        active-foreground: @foreground;
        normal-background: @background;
        normal-foreground: @foreground;
        urgent-background: {{color1}};
        urgent-foreground: @foreground;

        alternate-active-background: @background;
        alternate-active-foreground: @foreground;
        alternate-normal-background: @background;
        alternate-normal-foreground: @foreground;
        alternate-urgent-background: @background;
        alternate-urgent-foreground: @foreground;

        selected-active-background: {{color1}};
        selected-active-foreground: @foreground;
        selected-normal-background: {{color2}};
        selected-normal-foreground: @foreground;
        selected-urgent-background: {{color3}};
        selected-urgent-foreground: @foreground;

        background-color: @background;
        background: {{background}};
        foreground: {{foreground}};
        border-color: @background;
        spacing: 2;
        }

        #window {
          background-color: @background;
          border-color: {{color3}};
          border: 2px 2px 3px;
          padding: 2.5ch;
        }

        #mainbox {
          border: 0;
          padding: 0;
        }
        #message {
          border: 2px 0px 0px;
          border-color: @border-color;
          padding: 1px;
        }

        #textbox {
          text-color: @foreground;
        }

        #inputbar {
          children: [ prompt, textbox-prompt-colon, entry, case-indicator ];
        }

        #textbox-prompt-colon {
          expand: false;
          str: ":";
          margin: 0px 0.3em 0em 0em;
          text-color: @normal-foreground;
        }

        #listview {
          fixed-height: 0;
          border: 2px 0px 0px;
          border-color: @border-color;
          spacing: 2px;
          scrollbar: true;
          padding: 2px 0px 0px;
        }

        #element {
          border: 0;
          padding: 1px;
        }

        #element-text, element-icon {
          background-color: inherit;
          text-color: inherit;
        }

        #element.normal.normal {
          background-color: @normal-background;
          text-color: @normal-foreground;
        }

        #element.normal.urgent {
          background-color: @urgent-background;
          text-color: @urgent-foreground;
        }

        #element.normal.active {
          background-color: @active-background;
          text-color: @active-foreground;
        }

        #element.selected.normal {
          background-color: @selected-normal-background;
          text-color: @selected-normal-foreground;
        }

        #element.selected.urgent {
          background-color: @selected-urgent-background;
          text-color: @selected-urgent-foreground;
        }

        #element.selected.active {
          background-color: @selected-active-background;
          text-color: @selected-active-foreground;
        }

        #element.alternate.normal {
          background-color: @alternate-normal-background;
          text-color: @alternate-normal-foreground;
        }

        #element.alternate.urgent {
          background-color: @alternate-urgent-background;
          text-color: @alternate-urgent-foreground;
        }

        #element.alternate.active {
          background-color: @alternate-active-background;
          text-color: @alternate-active-foreground;
        }

        #scrollbar {
          width: 4px;
          border: 0;
          handle-width: 8px;
          padding: 0;
        }

        #sidebar {
          border: 2px 0px 0px;
          border-color: @border-color;
        }

        #button {
          text-color: @normal-foreground;
        }

        #button.selected {
          background-color: @selected-normal-background;
          text-color: @selected-normal-foreground;
        }

        #inputbar {
          spacing: 0;
          text-color: @normal-foreground;
          padding: 1px;
        }

        #case-indicator {
          spacing: 0;
          text-color: @normal-foreground;
        }

        #entry {
          spacing: 0;
          text-color: @normal-foreground;
        }

        #prompt {
          spacing: 0;
          text-color: @normal-foreground;
        }
        '';
    };
}