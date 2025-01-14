{...}:{
    home.stateVersion = "24.05";
    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;
    imports = [
        ./zsh.nix
    ];
}
