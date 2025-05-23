{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "pulseaudio"
          "battery"
          "backlight"
          "tray"
        ];

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

        "hyprland/window" = {
          format = "{}";
          separate-outputs = true;
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

        pulseaudio = {
          tooltip = true;
          tooltip-format = "Volume: {volume}%\nDevice: {desc}";
          scroll-step = 5;
          format = "{icon}     {volume}%";
          format-muted = "muted";
          format-bluetooth = "◈ {volume}% (BT)";
          format-bluetooth-muted = "◇ Muted (BT)";
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
          interval = 1;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}     {capacity}%";
          format-icons = ["" "" "" "" ""];
          max-length = 25;
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        font-family: "Cinzel Decorative", Georgia, Arial;
        font-size: 13px;
      }

    window#waybar {
        background: transparent;
        margin: 5px 5px 0 5px;
      }
    '';
  };
}