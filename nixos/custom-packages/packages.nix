{ pkgs, callPackage }:

with pkgs; [
   vim
   wget
   git
   gvfs
   mtpfs
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
   wev
   neovim
   electron_36
   neofetch
   polkit_gnome
   firejail
   bibata-cursors
   asusctl
   flatpak
   flatpak-builder
 ];