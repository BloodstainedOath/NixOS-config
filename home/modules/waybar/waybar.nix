{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    settings = {
      mainBar = {
        height = 30;
        layer = "top";

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
          "custom/hyprpicker"
          "custom/notification"
        ];

        modules-center = [
          "custom/previous"
          "mpris"
          "custom/next"
        ];

        modules-right = [
          "pulseaudio"
          "battery"
          "backlight"
          "tray"
          "clock"
          "custom/power"
        ];

        "hyprland/window" = {
          format = "{}";
          max-length = 50;
          separate-outputs = true;
        };

        pulseaudio = {
          tooltip = true;
          tooltip-format = "Volume: {volume}%\nDevice: {desc}";
          scroll-step = 5;
          format = "{icon}     {volume}%";
          format-muted = "muted";
          format-bluetooth = "◈ {volume}% (BT)";
          format-bluetooth-muted = "◇ Muted (BT)";
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          on-click-right = "pavucontrol";
          format-icons = {
            default = ["" "" ""];
          };
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon}  {percent}%";
          format-icons = ["" ""];
        };

        battery = {
          bat = "BAT1";
          interval = 1;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}     {capacity}%";
          format-icons = ["" "" "" "" ""];
          max-length = 25;
        };

        "custom/power" = {
          format = "⏻ ";
          tooltip = false;
          on-click = "wlogout";
          on-click-right = "killall rofi";
        };

        clock = {
          format = "🗓  {:%A - %B %d, %Y - %I:%M %p}";
          interval = 1;
          tooltip = true;
          tooltip-format = "<span font='18' weight='bold'>{:%I:%M:%S %p}</span>\n\n<span font='12' weight='bold'>📅  Calendar</span>\n<span font='monospace'><span foreground='#89b4fa'>{calendar}</span></span>";
          calendar = {
            mode = "month";
            format = {
              months = "<span color='#cba6f7'><b>{}</b></span>";
              days = "<span color='#f5c2e7'>{}</span>";
              weeks = "<span color='#94e2d5'><b>W{}</b></span>";
              weekdays = "<span color='#f9e2af'><b>{}</b></span>";
              today = "<span color='#f38ba8'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
          format-alt = "{:%Y-%m-%d}";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          tooltip = false;
          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            "7" = "七";
            "8" = "八";
            "9" = "九";
            "10" = "十";
          };
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "󰅸";
            none = "󰂜";
            dnd-notification = "󰅸";
            dnd-none = "󱏨";
            inhibited-notification = "󰅸";
            inhibited-none = "󰂜";
            dnd-inhibited-notification = "󰅸";
            dnd-inhibited-none = "󱏨";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click-right = "swaync-client -d -sw";
          on-click = "swaync-client -t -sw";
          escape = true;
        };

        "custom/hyprpicker" = {
          format = "";
          tooltip = false;
          on-click = "hyprpicker -a";
          on-click-right = "killall hyprpicker";
        };

        "custom/previous" = {
          format = "◄";
          on-click = "playerctl previous";
          on-click-middle = "playerctl position 0";
          tooltip = true;
          tooltip-format = "Previous Track";
        };

        mpris = {
          format = "♫ {artist} - {title}";
          format-paused = "◊ {artist} - {title}";
          format-stopped = "□ No media";
          format-disconnected = "⊠ Disconnected";
          max-length = 40;
          tooltip-format = "▣ {album}\n▣ {title} ({length})";
          on-click = "playerctl play-pause";
          on-click-middle = "playerctl stop";
          on-click-right = "kitty --title floating ncmpcpp";
          on-scroll-up = "playerctl next";
          on-scroll-down = "playerctl previous";
          interval = 1;
        };

        "custom/next" = {
          format = "►";
          on-click = "playerctl next";
          on-click-middle = "playerctl shuffle toggle";
          tooltip = true;
          tooltip-format = "Next Track";
        };
      };
    };

    # Import the wallust-generated colors and use them in the style
    style = ''
      @import "colors.css";

      * {
        border: none;
        border-radius: 10px;
        font-family: "Cinzel Decorative", Georgia, Arial;
        font-size: 12px;
        min-height: 0;
        transition-duration: 0.3s;
      }

      window#waybar {
        background: transparent;
        margin: 5px 5px 0 5px;
      }

      window#waybar.hidden {
        opacity: 0.4;
      }

      /* Module common styling using wallust colors */
      #workspaces,
      #pulseaudio,
      #battery,
      #backlight,
      #tray,
      #clock,
      #custom-power,
      #network,
      #window,
      #custom-media,
      #custom-hyprpicker,
      #bluetooth {
        background-color: alpha(@background, 0.8);
        padding: 0 12px;
        margin: 0 4px;
        border-radius: 10px;
        min-height: 20px;
        box-shadow: 0 0 2px alpha(@background, 0.5);
        border: 1px solid alpha(currentColor, 0.05);
        color: currentColor;
        text-shadow: 0 0 6px currentColor,
                     0 0 12px alpha(currentColor, 0.8),
                     0 0 20px alpha(currentColor, 0.6);
        transition: all 0.3s ease;
      }

      #workspaces:hover,
      #pulseaudio:hover,
      #battery:hover,
      #backlight:hover,
      #tray:hover,
      #clock:hover,
      #custom-power:hover,
      #network:hover,
      #window:hover,
      #custom-media:hover,
      #custom-hyprpicker:hover,
      #bluetooth:hover {
        background-color: alpha(@background, 0.7);
        border: 1px solid alpha(currentColor, 0.2);
        text-shadow: 0 0 10px currentColor,
                     0 0 20px currentColor,
                     0 0 30px alpha(currentColor, 0.8);
      }

      /* Window title styling */
      #window {
        color: @color7;
        font-style: italic;
        background-color: alpha(@background, 0.95);
        padding: 0 15px;
        margin: 0 4px;
        border-radius: 10px;
        font-weight: bolder;
        min-width: 100px;
        text-shadow: 0 0 8px @color7,
                     0 0 15px alpha(@color7, 0.8);
      }

      #window.empty {
        background-color: transparent;
        box-shadow: none;
      }

      #window.focused {
        border-bottom: 2px solid @color4;
        text-shadow: 0 0 10px @color4,
                     0 0 20px @color4,
                     0 0 30px alpha(@color4, 0.7);
      }

      /* Workspaces styling */
      #workspaces {
        background-color: alpha(@background, 0.95);
        border-radius: 10px;
        margin-left: 5px;
        padding: 0 5px;
      }

      #workspaces button {
        padding: 0 8px;
        background-color: transparent;
        color: @color5;
        border-radius: 10px;
        margin: 2px;
        font-size: 13px;
        text-shadow: 0 0 6px @color5,
                     0 0 12px alpha(@color5, 0.7);
        transition: all 0.2s ease;
      }

      #workspaces button:hover {
        background: alpha(@color4, 0.2);
        color: @foreground;
        text-shadow: 0 0 10px @color4,
                     0 0 20px @color4;
      }

      /* Active workspace styling */
      #workspaces button.active {
        background-color: alpha(@color1, 0.2);
        text-shadow: 0 0 10px @color1,
                     0 0 20px @color1,
                     0 0 30px alpha(@color1, 0.8);
        animation: active-workspace-text-glow 3s infinite alternate;
      }

      @keyframes active-workspace-text-glow {
        0% {
          text-shadow: 0 0 8px @color1, 
                       0 0 15px @color1;
        }
        100% {
          text-shadow: 0 0 15px @color1, 
                       0 0 25px @color1, 
                       0 0 35px @color1;
        }
      }

      #workspaces button.urgent {
        background-color: transparent;
        color: @color1;
        border: 1px solid @color1;
        animation: urgent-text-glow 1.5s infinite;
      }

      @keyframes urgent-text-glow {
        0% {
          text-shadow: 0 0 5px @color1;
        }
        50% {
          text-shadow: 0 0 15px @color1, 
                       0 0 25px @color1;
        }
        100% {
          text-shadow: 0 0 5px @color1;
        }
      }

      /* Power button */
      #custom-power {
        color: @color1;
        font-size: 16px;
        margin-right: 8px;
        padding: 0 12px;
        text-shadow: 0 0 10px @color1,
                     0 0 20px @color1,
                     0 0 30px alpha(@color1, 0.8);
        animation: power-text-pulse 4s infinite alternate;
      }

      @keyframes power-text-pulse {
        0% {
          text-shadow: 0 0 8px @color1, 
                       0 0 15px @color1;
        }
        100% {
          text-shadow: 0 0 15px @color1, 
                       0 0 25px @color1, 
                       0 0 40px @color1;
        }
      }

      #custom-power:hover {
        background-color: alpha(@color1, 0.15);
        text-shadow: 0 0 15px @color1,
                     0 0 30px @color1,
                     0 0 45px alpha(@color1, 0.9);
      }

      /* Clock */
      #clock {
        color: @color7;
        font-weight: bold;
        padding: 0 15px;
        text-shadow: 0 0 10px @color7,
                     0 0 20px alpha(@color7, 0.8);
      }

      /* System modules */
      #pulseaudio {
        color: @color3;
        padding: 0 12px;
        text-shadow: 0 0 10px @color3,
                     0 0 20px alpha(@color3, 0.8);
      }

      #pulseaudio.muted {
        color: @color8;
        text-shadow: 0 0 8px @color8,
                     0 0 15px alpha(@color8, 0.7);
      }

      #battery {
        color: @color2;
        padding: 0 12px;
        text-shadow: 0 0 10px @color2,
                     0 0 20px alpha(@color2, 0.8);
      }

      #battery.charging {
        color: @color2;
        text-shadow: 0 0 12px @color2,
                     0 0 25px @color2;
        animation: charging-text-pulse 2s infinite alternate;
      }

      @keyframes charging-text-pulse {
        0% {
          text-shadow: 0 0 8px @color2, 
                       0 0 15px @color2;
        }
        100% {
          text-shadow: 0 0 15px @color2, 
                       0 0 25px @color2, 
                       0 0 35px @color2;
        }
      }

      #battery.warning:not(.charging) {
        color: @color3;
        text-shadow: 0 0 12px @color3,
                     0 0 25px @color3;
      }

      #battery.critical:not(.charging) {
        color: @color1;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      @keyframes blink {
        to {
          color: @foreground;
          background-color: @color1;
          text-shadow: 0 0 10px @foreground;
        }
      }

      #backlight {
        color: @color4;
        padding: 0 12px;
        text-shadow: 0 0 10px @color4,
                     0 0 20px alpha(@color4, 0.8);
      }

      #network {
        color: @color5;
        padding: 0 12px;
        text-shadow: 0 0 10px @color5,
                     0 0 20px alpha(@color5, 0.8);
      }

      #network.disconnected {
        color: @color1;
        text-shadow: 0 0 12px @color1,
                     0 0 25px @color1;
      }

      #tray {
        padding: 0 12px;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        color: @color1;
      }

      /* Media player */
      #custom-media {
        background-color: alpha(@background, 0.95);
        color: @color6;
        border-radius: 10px;
        margin: 0 4px;
        padding: 0 15px;
        min-width: 100px;
        text-shadow: 0 0 10px @color6,
                     0 0 20px alpha(@color6, 0.8);
      }

      #custom-media.custom-spotify {
        color: @color2;
        text-shadow: 0 0 10px @color2,
                     0 0 20px alpha(@color2, 0.8);
      }

      #custom-media.custom-firefox {
        color: @color3;
        text-shadow: 0 0 10px @color3,
                     0 0 20px alpha(@color3, 0.8);
      }

      #custom-media.custom-chromium {
        color: @color4;
        text-shadow: 0 0 10px @color4,
                     0 0 20px alpha(@color4, 0.8);
      }

      #custom-media.custom-vlc {
        color: @color5;
        text-shadow: 0 0 10px @color5,
                     0 0 20px alpha(@color5, 0.8);
      }

      /* Notification module styling */
      #custom-notification {
        background-color: alpha(@background, 0.95);
        padding: 0 12px;
        margin: 0 4px;
        border-radius: 10px;
        color: @color6;
        font-size: 16px;
        text-shadow: 0 0 10px @color6,
                     0 0 20px alpha(@color6, 0.8);
      }

      #custom-notification:hover {
        background-color: alpha(@foreground, 0.15);
        text-shadow: 0 0 15px currentColor,
                     0 0 30px currentColor;
      }

      /* Different states of the notification icon */
      #custom-notification.notification {
        color: @color1;
        text-shadow: 0 0 12px @color1,
                     0 0 25px @color1;
        animation: notification-text-pulse 2s infinite alternate;
      }

      @keyframes notification-text-pulse {
        0% {
          text-shadow: 0 0 8px @color1, 
                       0 0 15px @color1;
        }
        100% {
          text-shadow: 0 0 15px @color1, 
                       0 0 25px @color1, 
                       0 0 35px @color1;
        }
      }

      #custom-notification.dnd-notification {
        color: @color1;
        text-shadow: 0 0 12px @color1,
                     0 0 25px @color1;
      }

      #custom-notification.inhibited-notification {
        color: @color1;
        text-shadow: 0 0 12px @color1,
                     0 0 25px @color1;
      }

      #custom-notification.dnd-inhibited-notification {
        color: @color1;
        text-shadow: 0 0 12px @color1,
                     0 0 25px @color1;
      }

      #custom-notification.dnd-none,
      #custom-notification.dnd-inhibited-none {
        color: @color8;
        text-shadow: 0 0 8px @color8,
                     0 0 15px alpha(@color8, 0.7);
      }

      /* Hyprpicker module */
      #custom-hyprpicker {
        color: @color5;
        font-size: 16px;
        padding: 0 12px;
        text-shadow: 0 0 10px @color5,
                     0 0 20px alpha(@color5, 0.8);
      }

      #custom-hyprpicker:hover {
        background-color: alpha(@color5, 0.15);
        text-shadow: 0 0 15px @color5,
                     0 0 30px @color5;
      }

      /* Bluetooth module */
      #bluetooth {
        color: @color4;
        font-size: 18px;
        margin-left: 8px;
        padding: 0 12px;
        text-shadow: 0 0 10px @color4,
                     0 0 20px alpha(@color4, 0.8);
      }

      #bluetooth.off {
        color: @color8;
        text-shadow: 0 0 8px @color8,
                     0 0 15px alpha(@color8, 0.7);
      }

      #bluetooth.connected {
        color: @color2;
        text-shadow: 0 0 12px @color2,
                     0 0 25px @color2;
      }

      #bluetooth.discovering {
        color: @color4;
        animation: bluetooth-text-pulse 1.5s infinite;
      }

      @keyframes bluetooth-text-pulse {
        0% {
          opacity: 1;
          text-shadow: 0 0 8px @color4, 
                       0 0 15px @color4;
        }
        50% {
          opacity: 0.7;
          text-shadow: 0 0 15px @color4, 
                       0 0 30px @color4;
        }
        100% {
          opacity: 1;
          text-shadow: 0 0 8px @color4, 
                       0 0 15px @color4;
        }
      }

      /* Music player controls */
      #custom-previous,
      #custom-next,
      #mpris {
        background-color: alpha(@background, 0.95);
        margin: 0 2px;
        border-radius: 10px;
        transition: all 0.3s ease;
        color: @color5;
        text-shadow: 0 0 10px @color5,
                     0 0 20px alpha(@color5, 0.8);
        border: 1px solid alpha(@color5, 0.1);
      }

      #custom-previous,
      #custom-next {
        font-size: 18px;
        font-weight: bold;
        padding: 0 10px;
        animation: control-text-neon-pulse 2s infinite alternate;
      }

      @keyframes control-text-neon-pulse {
        0% {
          text-shadow: 0 0 8px @color5, 
                       0 0 15px @color5;
        }
        100% {
          text-shadow: 0 0 15px @color5, 
                       0 0 25px @color5, 
                       0 0 40px @color5;
        }
      }

      #custom-previous:hover,
      #custom-next:hover {
        background-color: alpha(@color4, 0.15);
        text-shadow: 0 0 15px @color4,
                     0 0 30px @color4;
        border: 1px solid alpha(@color4, 0.3);
      }

      #mpris {
        min-width: 100px;
        padding: 0 12px;
        font-style: italic;
      }

      #mpris.playing {
        border-bottom: 2px solid @color2;
        text-shadow: 0 0 12px @color2, 
                     0 0 25px @color2;
        animation: mpris-text-pulse 2s infinite alternate;
      }

      #mpris.paused {
        border-bottom: 2px solid @color3;
        color: alpha(@color6, 0.7);
        text-shadow: 0 0 8px @color3;
      }

      #mpris.stopped {
        color: @color8;
        text-shadow: 0 0 8px @color8,
                     0 0 15px alpha(@color8, 0.7);
      }

      #mpris:hover {
        background-color: alpha(@color6, 0.15);
        text-shadow: 0 0 15px @color6, 
                     0 0 30px @color6;
        border: 1px solid alpha(@color6, 0.3);
      }

      @keyframes mpris-text-pulse {
        0% {
          text-shadow: 0 0 8px @color2, 
                       0 0 15px @color2;
        }
        100% {
          text-shadow: 0 0 15px @color2, 
                       0 0 25px @color2, 
                       0 0 40px @color2;
        }
      }
    '';
  };
}