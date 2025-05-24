{ config, pkgs, ... }:

{
  services.swaync = {
    enable = true;
    
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-command = true;
      notification-inline-replies = false;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      control-center-width = 500;
      control-center-height = 600;
      notification-window-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      scripts = {
        example-script = {
          exec = "echo 'Do something...'";
          urgency = "Normal";
        };
      };
      notification-visibility = {
        example-name = {
          state = "muted";
          urgency = "Low";
          category = "Im";
        };
      };
      widgets = [
        "inhibitors"
        "title"
        "dnd"
        "notifications"
      ];
      widget-config = {
        inhibitors = {
          text = "Inhibitors";
          button-text = "Clear All";
          clear-all-button = true;
        };
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 5;
          text = "Label Text";
        };
        mpris = {
          image-size = 96;
          image-radius = 12;
        };
      };
    };

    # Custom CSS styling using wallust colors
    style = ''
      @import "colors.css";

      * {
        font-family: "Cinzel Decorative", Georgia, Arial;
        font-weight: bold;
        font-size: 14px;
        border-radius: 12px;
        outline: none;
      }

      /* Notification window */
      .notification-row {
        outline: none;
        margin: 10px;
        padding: 0;
      }

      .notification-row:focus,
      .notification-row:hover {
        background: alpha(@color4, 0.1);
      }

      .notification {
        background: alpha(@background, 0.95);
        border: 2px solid alpha(@color8, 0.3);
        border-radius: 12px;
        margin: 6px 12px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        padding: 0;
        transition: all 200ms ease;
      }

      .notification:hover {
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.4);
        border-color: @color4;
      }

      .notification.critical {
        border-color: @color1;
        box-shadow: 0 4px 8px alpha(@color1, 0.3);
      }

      .notification.low {
        border-color: @color8;
      }

      .notification.normal {
        border-color: @color4;
      }

      /* Notification content */
      .notification-content {
        background: transparent;
        padding: 16px;
        border-radius: 12px;
      }

      .notification-default-action,
      .notification-action {
        padding: 4px;
        margin: 0;
        box-shadow: none;
        background: alpha(@background, 0.95);
        border: 1px solid alpha(@color8, 0.3);
        color: @foreground;
        transition: all 200ms ease;
      }

      .notification-default-action:hover,
      .notification-action:hover {
        background: alpha(@color4, 0.2);
        border-color: @color4;
      }

      .notification-default-action {
        border-radius: 12px;
      }

      /* Close button */
      .close-button {
        background: alpha(@color1, 0.8);
        color: @foreground;
        text-shadow: none;
        padding: 0;
        border-radius: 100%;
        margin-top: 10px;
        margin-right: 16px;
        box-shadow: none;
        border: none;
        min-width: 24px;
        min-height: 24px;
        transition: all 200ms ease;
      }

      .close-button:hover {
        box-shadow: 0 0 6px @color1;
        background: @color1;
      }

      /* Notification icon */
      .notification-icon {
        border-radius: 8px;
        margin: 0 12px 0 0;
      }

      /* Text elements */
      .summary {
        font-size: 16px;
        font-weight: bold;
        color: @foreground;
        text-shadow: 0 0 2px alpha(@foreground, 0.5);
        margin-bottom: 4px;
      }

      .time {
        font-size: 11px;
        font-weight: bold;
        color: @color6;
        text-shadow: 0 0 1px @color6;
      }

      .body {
        font-size: 14px;
        font-weight: normal;
        color: @color7;
        margin-top: 8px;
      }

      /* Control Center */
      .control-center {
        background: alpha(@background, 0.98);
        border: 2px solid alpha(@color8, 0.5);
        border-radius: 18px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
        margin: 18px;
        padding: 12px;
      }

      .control-center-list {
        background: transparent;
      }

      .control-center-list-placeholder {
        opacity: 0.5;
        color: @color8;
        font-size: 18px;
        margin: 50px 0;
      }

      /* Widget styling */
      .widget-title {
        color: @color5;
        background: alpha(@color5, 0.1);
        padding: 8px 16px;
        margin: 8px 16px 16px 16px;
        font-size: 1.5rem;
        border-radius: 12px;
        box-shadow: inset 0 0 0 1px alpha(@color5, 0.3);
        text-shadow: 0 0 2px @color5;
      }

      .widget-title > button {
        font-size: 1rem;
        color: @foreground;
        text-shadow: none;
        background: alpha(@color2, 0.8);
        box-shadow: inset 0 0 0 1px alpha(@color2, 0.5);
        border: none;
        border-radius: 8px;
        padding: 8px 16px;
        transition: all 200ms ease;
      }

      .widget-title > button:hover {
        background: @color2;
        color: @background;
        box-shadow: 0 0 6px @color2;
      }

      /* DND toggle */
      .widget-dnd {
        background: alpha(@color3, 0.1);
        padding: 8px 16px;
        margin: 8px 16px 16px 16px;
        border-radius: 12px;
        font-size: large;
        color: @color3;
        text-shadow: 0 0 2px @color3;
        box-shadow: inset 0 0 0 1px alpha(@color3, 0.3);
      }

      .widget-dnd > switch {
        border-radius: 4px;
        background: alpha(@color8, 0.5);
      }

      .widget-dnd > switch:checked {
        background: @color3;
        box-shadow: 0 0 6px @color3;
      }

      .widget-dnd > switch slider {
        background: @foreground;
        border-radius: 100%;
        transition: all 200ms ease;
      }

      .widget-dnd > switch:checked slider {
        background: @background;
        box-shadow: 0 0 4px @background;
      }

      /* Inhibitors */
      .widget-inhibitors {
        color: @color1;
        background: alpha(@color1, 0.1);
        padding: 8px 16px;
        margin: 8px 16px 16px 16px;
        border-radius: 12px;
        font-size: large;
        text-shadow: 0 0 2px @color1;
        box-shadow: inset 0 0 0 1px alpha(@color1, 0.3);
      }

      .widget-inhibitors > button {
        font-size: 1rem;
        color: @foreground;
        text-shadow: none;
        background: alpha(@color1, 0.8);
        box-shadow: inset 0 0 0 1px alpha(@color1, 0.5);
        border: none;
        border-radius: 8px;
        padding: 8px 16px;
        transition: all 200ms ease;
      }

      .widget-inhibitors > button:hover {
        background: @color1;
        color: @background;
        box-shadow: 0 0 6px @color1;
      }

      /* Label widget */
      .widget-label {
        color: @color6;
        background: alpha(@color6, 0.1);
        padding: 8px 16px;
        margin: 8px 16px 16px 16px;
        border-radius: 12px;
        text-shadow: 0 0 2px @color6;
        box-shadow: inset 0 0 0 1px alpha(@color6, 0.3);
      }

      .widget-label > label {
        font-size: 1rem;
      }

      /* MPRIS widget */
      .widget-mpris {
        color: @color2;
        background: alpha(@color2, 0.1);
        padding: 8px 16px;
        margin: 8px 16px 16px 16px;
        border-radius: 12px;
        text-shadow: 0 0 2px @color2;
        box-shadow: inset 0 0 0 1px alpha(@color2, 0.3);
      }

      .widget-mpris > box > button {
        border-radius: 8px;
        color: @foreground;
        background: alpha(@color2, 0.8);
        border: none;
        padding: 8px;
        margin: 4px;
        transition: all 200ms ease;
      }

      .widget-mpris > box > button:hover {
        background: @color2;
        color: @background;
        box-shadow: 0 0 6px @color2;
      }

      .widget-mpris-player {
        padding: 8px 16px;
        margin: 8px 16px 16px 16px;
        background: alpha(@background, 0.9);
        border-radius: 12px;
        border: 1px solid alpha(@color2, 0.3);
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      }

      .widget-mpris-title {
        font-weight: bold;
        font-size: 1.25rem;
        color: @foreground;
        text-shadow: 0 0 2px alpha(@foreground, 0.5);
      }

      .widget-mpris-subtitle {
        font-size: 1.1rem;
        color: @color7;
      }

      /* Buttons - Fixed CSS grid properties */
      .widget-buttons-grid {
        padding: 8px;
        border-radius: 12px;
      }

      .widget-buttons-grid > flowbox {
        margin: 4px;
      }

      .widget-buttons-grid > flowbox > flowboxchild {
        margin: 4px;
      }

      .widget-buttons-grid > flowbox > flowboxchild > button {
        margin: 0;
        background: alpha(@color4, 0.8);
        border: none;
        border-radius: 8px;
        color: @foreground;
        font-size: 1.5rem;
        padding: 8px;
        transition: all 200ms ease;
      }

      .widget-buttons-grid > flowbox > flowboxchild > button:hover {
        background: @color4;
        color: @background;
        box-shadow: 0 0 6px @color4;
      }

      /* Scrollbars */
      .floating-notifications .notification-row .notification scrollbar {
        all: unset;
        border-radius: 8px;
        background: alpha(@color8, 0.3);
        margin: 2px;
        opacity: 0.7;
      }

      .floating-notifications .notification-row .notification scrollbar:hover {
        opacity: 1;
      }

      .floating-notifications .notification-row .notification scrollbar slider {
        all: unset;
        min-width: 8px;
        min-height: 8px;
        border-radius: 8px;
        background: @color4;
        transition: all 200ms ease;
      }

      .floating-notifications .notification-row .notification scrollbar slider:hover {
        background: @color12;
        box-shadow: 0 0 4px @color4;
      }

      /* Animations - Using opacity-only since GTK doesn't support transform */
      @keyframes notification-fade-in {
        from {
          opacity: 0;
        }
        to {
          opacity: 1;
        }
      }

      @keyframes notification-fade-out {
        from {
          opacity: 1;
        }
        to {
          opacity: 0;
        }
      }

      .notification {
        animation: notification-fade-in 200ms ease-out;
      }

      .notification.dismissed {
        animation: notification-fade-out 200ms ease-in;
      }
    '';
  };
}