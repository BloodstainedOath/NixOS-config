# /etc/nixos/modules/services.nix
{ config, pkgs, lib, ... }:

{

  # Enable Zsh shell
  programs.zsh.enable = true;
  
  programs.gamemode.enable = true;

  services.gvfs.enable = true;

  services.flatpak.enable = true;

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;  # Optional but useful
  };

  # Enable the Bluetooth service
  services.blueman.enable = true;  # for GUI (GTK-based), optional

  # Optional: add bluetooth tools
  environment.systemPackages = with pkgs; [
    bluez
    bluez-tools
    blueman  # GUI frontend
  ];

  # Allow Flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
