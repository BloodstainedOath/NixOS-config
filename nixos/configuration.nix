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


  
    programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };
  };

    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      useGlobalPkgs = true;  # Add this line
      useUserPackages = true;  # Add this line
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
  # Core System Tools
  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  wget
  git
  zip
  unzip
  home-manager
  nurl

  # Terminal & Shell
  kitty
  zsh-autosuggestions
  zsh-syntax-highlighting
  neovim

  # File Management & Utilities
  gvfs
  mtpfs
  lsd
  bat
  btop
  neofetch

  # Development & Editors
  kdePackages.kate
  vscodium
  electron_36

  # Desktop Environment & Theming
  sddm-sugar-dark
  (callPackage ./custom-packages/sddm-theme.nix {}).sddm-theme
  xdg-desktop-portal
  xdg-desktop-portal-gtk
  xdg-desktop-portal-hyprland
  libnotify
  polkit_gnome
  bibata-cursors

  # Fonts & Display
  fontfinder
  font-manager
  brightnessctl
  wev

  # Applications & Package Management
  appimage-run
  flatpak
  flatpak-builder

  # Security & Hardware
  firejail
  asusctl
];

  environment.variables = {
    XCURSOR_THEME = "Bibata-Rainbow-Modern";
    XCURSOR_SIZE = "24";
  };

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ALL = "en_US.UTF-8";
  };

  services.asusd.enable = true;

  # Firewall
  networking = {
    nftables = {
      enable = true;
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
      allowPing = false;
    };
  };

  system.stateVersion = "24.11";

}

