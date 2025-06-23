{ config, pkgs, lib, ... }:

{
    services.ollama = {
        enable = true;
        acceleration = "cuda";
    };
}