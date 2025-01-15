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
    gtk-adwaita = false;
    gtk-titlebar = false;
  };
};

}
