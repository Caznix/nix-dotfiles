{ config, lib, pkgs,flake-self, ... }:
{

    home.packages = [
      flake-self.inputs.wall-utils.packages.${pkgs.system}.wall-utils
    ];
    programs.wall-utils = {
      enable = true;
      settings = {
        wallpaper_dir = "${config.home.homeDirectory}/.config/wall-utils/wallpapers";
        output_dir = "${config.home.homeDirectory}/.config/wall-utils/outs";
        cache_dir = "${config.home.homeDirectory}/.config/wall-utils/caches";
        dmenu = "${pkgs.rofi-wayland}/bin/rofi -dmenu -config ~/.config/rofi/themeselect.rasi -theme-str \"element{border-radius:$(( $(${pkgs.hyprland}/bin/hyprctl -j getoption decoration:rounding | ${pkgs.jq}/bin/jq '.int') * 3 ))px;} listview{columns:6;spacing:100px;} element{padding:0px;orientation:vertical;} element-icon{size:$(( $(${pkgs.hyprland}/bin/hyprctl -j monitors | ${pkgs.jq}/bin/jq '.[] | select(.focused==true) | .width') * 17 / $(${pkgs.hyprland}/bin/hyprctl -j monitors | ${pkgs.jq}/bin/jq '.[] | select (.focused == true) | .scale' | ${pkgs.gnused}/bin/sed 's/\\.//') ))px;border-radius:0px;} element-text{padding:20px;}\"";
        wallset = "${pkgs.swww}/bin/swww img --transition-bezier .43,1.19,1,.4  --transition-type \"grow\"  --transition-duration 0.7  --transition-fps 60  --invert-y  --transition-pos \"$( ${pkgs.hyprland}/bin/hyprctl cursorpos )\"";
        wallset_previous = "${pkgs.swww}/bin/swww img --transition-bezier .43,1.19,1,.4  --transition-type \"outer\"  --transition-duration 0.7  --transition-fps 60  --invert-y  --transition-pos \"$( ${pkgs.hyprland}/bin/hyprctl cursorpos )\"";
      };
  };
}