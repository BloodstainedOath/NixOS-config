# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/desktop.nix
      ./modules/nvidia.nix
      ./modules/user.nix
      ./modules/services.nix
      ./modules/sound.nix
      ./modules/portal.nix
      ./modules/bootloader.nix
      ./modules/sddm.nix
      ./modules/fonts.nix
      ./custom-packages/cursor.nix
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      users = {
        hunter = import ../home/home.nix;
      };
    };



   networking.hostName = "yharnam"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
   time.timeZone = "Asia/Kolkata";

  # Enable CUPS to print documents.
   services.printing.enable = true;

  # $ nix search wget
 environment.systemPackages = with pkgs; [
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   wget
   git
   mtpfs
   gvfs
   kitty
   kdePackages.kate
   zip
   unzip
   lsd
   bat
   zsh-autosuggestions
   zsh-syntax-highlighting
   home-manager
   nurl
   sddm-sugar-dark
   btop
   fontfinder
   font-manager
   (callPackage ./custom-packages/sddm-theme.nix {}).sddm-theme
   xdg-desktop-portal
   xdg-desktop-portal-gtk
   xdg-desktop-portal-hyprland
   libnotify
   appimage-run
   vscodium
   brightnessctl
 ];
  environment.variables = {
    XCURSOR_THEME = "Bibata-Rainbow-Modern";
    XCURSOR_SIZE = "24"; # Optional: set cursor size (16, 24, 32, 48)
  };

  system.stateVersion = "24.11";

}

