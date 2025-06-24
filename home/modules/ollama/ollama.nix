{ config, pkgs, ... }:

{
  services.ollama = {
    enable = true;
    accelleration = "cuda";
  };
}