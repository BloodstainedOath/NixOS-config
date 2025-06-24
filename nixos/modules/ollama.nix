{ config, pkgs, ... }:

{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    loadModels = [ "codellama:13b" "starcoder2:7b"];
  };
  services.open-webui.enable;
}