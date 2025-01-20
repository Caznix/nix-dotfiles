{ pkgs,... }:
{
home.packages = with pkgs; [
    wl-clipboard
    brightnessctl
];

 wayland.windowManager.hyprland = {
    enable = true;

    settings = {
        general = {
        resize_on_border = true;        # Enables resizing by dragging window borders
        extend_border_grab_area = 15;   # Extends the clickable area around the border for resizing
        hover_icon_on_border = true;    # Shows a cursor icon when
                };
        exec-once = [
          "${pkgs.kdePackages.kwallet-pam}/libexec/pam_kwallet_init"
          "${pkgs.networkmanagerapplet}/bin/nm-applet"
          "${pkgs.blueman}/bin/blueman-applet"
          "${pkgs.kdePackages.kdeconnect-kde}/bin/kdeconnect-indicator"
          "${pkgs.kdePackages.kdeconnect-kde}/bin/kdeconnectd"
          "sleep 2 && ${pkgs.swww}/bin/swww-daemon"
        ];

        "$super" = "SUPER";
        "$alt_super" = "CTRL_SUPER";


        bind = [
            "$super, Q, killactive"
            "$alt_super,Q,exit"

            "$super,T, exec, ghostty"
            "$super, B,exec,firefox"
            "$super,F,fullscreen"
            "$alt_super,F,togglefloating"
            "ALT,SPACE,exec, rofi -show"
             "$super, 1, workspace, 1"
             "$super, 2, workspace, 2"
             "$super, 3, workspace, 3"
             "$super, 4, workspace, 4"
             "$super, 5, workspace, 5"
             "$super, 6, workspace, 6"
             "$super, 7, workspace, 7"
             "$super, 8, workspace, 8"
             "$super, 9, workspace, 9"
             "$super, 0, workspace, 10"
   
             # Move active window to a workspace iwth mainMod + SHIFT + [0-9]
             "$super SHIFT, 1, movetoworkspace, 1"
             "$super SHIFT, 2, movetoworkspace, 2"
             "$super SHIFT, 3, movetoworkspace, 3"
             "$super SHIFT, 4, movetoworkspace, 4"
             "$super SHIFT, 5, movetoworkspace, 5"
             "$super SHIFT, 6, movetoworkspace, 6"
             "$super SHIFT, 7, movetoworkspace, 7"
             "$super SHIFT, 8, movetoworkspace, 8"
             "$super SHIFT, 9, movetoworkspace, 9"
             "$super SHIFT, 0, movetoworkspace, 10"

        ];
        bindm = [
            "$super, mouse:272, movewindow"
            "$super, mouse:273, resizewindow"
        ];
        monitor = [
            "eDP-1,1920x1080@60,auto,1"
        ];
        decoration = {
          rounding = 10;
          shadow.enabled = true;
          blur = {
            enabled = true;
            size = 6;
            passes = 3;
            new_optimizations = true;
            ignore_opacity = true;
            xray = true;
          };
        };
        animation = [
            "windows, 1, 8, default, popin 80%"
            "layers,1,10,default,popin"
        ];
        windowrule = [
          "float,title:(PolicyKit1)(.*)$"
          "float,title:^(Bluetooth Devices)$"
          "float,title:^(Network Connections)$"
          "tile,title:(LibreOffice)"
          "tile,title:Skype"
          ];

        windowrulev2 = [
          "tile,title:^(.*)(Minecraft)(.*)$"
          "float,title:(CopyQ)$,"
          "size 400 400,title:(CopyQ)$"
          "float, title:^(Volume Control)$"
          "size 700 600, title:^(Volume Control)$"
        ];
    };
 };

}
