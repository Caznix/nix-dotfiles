{ pkgs, config, lib, ... }:

{
    home.packages = with pkgs; [
      rofi-wayland
    ];
    home.file.".config/rofi" = {
      source = ./rofi;
      recursive = true;
    };
    home.file.".config/rofi/roficalc.sh" = {
      source = ./roficalc.sh;
    };
}
