{ pkgs, config, lib, ... }:
{
    home.packages = with pkgs; [
      dunst
      rofi-wayland
    ];

    home.file.".config/dunst/icons" = {
      source = ./icons;
      recursive = true;
    };

    services.dunst = {
      enable = true;
      iconTheme.name = "Tela-circle-dark";
      iconTheme.package = pkgs.tela-circle-icon-theme;
      settings = {
        global = {
          monitor = 0;
          follow = "none";
          width = 300;
          height = 300;
          origin = "top-right";
          offset = "10x50";
          scale = 0;
          notification_limit = 20;
          progress_bar = true;
          progress_bar_min_width = 150;
          progress_bar_max_width = 300;
          progress_bar_corner_radius = 4;
          icon_corner_radius = 5;
          indicate_hidden = true;
          transparency = 30;
          separator_height = 2;
          padding = 8;
          horizontal_padding = 8;
          text_icon_padding = 10;
          frame_width = 2;
          frame_color = "#f9e2af";
          background = "#1e1e2eb3";
          highlight = "#cba6f7";
          gap_size = 5;
          separator_color = "auto";
          sort = true;
          font = "JetBrainsMono Nerd Font 10";
          line_height = 3;
          markup = "full";
          format = "󱃸 %a \\n<b>󰯃 %s</b>\\n%b";
          alignment = "left";
          vertical_alignment = "center";
          show_age_threshold = 60;
          ellipsize = "end";
          ignore_newline = false;
          stack_duplicates = true;
          hide_duplicate_count = false;
          show_indicators = true;
          enable_recursive_icon_lookup = true;
          icon_position = "left";
          min_icon_size = 32;
          max_icon_size = 128;

          sticky_history = true;
          history_length = 20;

          dmenu = "${pkgs.rofi-wayland}/bin/rofi -dmenu -p dunst";
          browser = "${pkgs.xdg-utils}/bin/xdg-open";
          always_run_script = true;
          title = "Dunst";
          class = "Dunst";
          corner_radius = 10;
          ignore_dbusclose = false;
          force_xwayland = false;
          force_xinerama = false;

          mouse_left_click = "context, close_current";
          mouse_middle_click = "do_action, close_current";
          mouse_right_click = "close_all";
        };
        experimental = {
          per_monitor_dpi = false;
        };

        Type-1 = {
          summary = "t1";
          format = "<b>%a</b>";
        };

        Type-2 = {
          summary = "t2";
          format = "<span size = \"250%\">%a</span>\\n%b";
        };

        urgency_low = {
          foreground = "#a6adc8";
          frame_color = "#a6e4a1";
          timeout = 10;
          default_icon = "~/.config/dunst/icons/info.svg";
        };

        urgency_normal = {
          foreground = "#a6adc8";
          frame_color = "#f9e2af";
          timeout = 10;
          default_icon = "~/.config/dunst/icons/lamp-svgrepo-com.svg";
        };

        urgency_critical = {
          foreground = "#a6adc8";
          frame_color = "#f38ba8";
          timeout = 0;
          default_icon = "~/.config/dunst/icons/error.png";
        };
      };
    };
}
