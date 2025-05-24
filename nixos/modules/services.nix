# /etc/nixos/modules/services.nix
{ config, pkgs, ... }:

{

  # Enable Zsh shell
  programs.zsh.enable = true;

  services.gvfs.enable = true;

  # Allow Flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
