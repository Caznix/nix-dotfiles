{ ... }:
{
programs.ghostty = {
    enable = true;

  settings = {
    background-blur-radius = 80;
    theme = "dark:catppuccin-mocha,light:catppuccin-latte";
    window-theme = "dark";
    background-opacity = 0.95;
    minimum-contrast = 1.1;
    window-padding-x = 15;
    window-padding-y = 15;
    gtk-adwaita = false;
    gtk-titlebar = false;

  };
};

}
