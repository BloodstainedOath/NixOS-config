{ config, pkgs, ... }:

{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };
}