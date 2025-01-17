{pkgs, ...}:{
    home.stateVersion = "24.05";
    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;
    imports = [
        ./zsh.nix
        ./ghostty.nix
        ./vscode.nix
    ];
    home.packages = with pkgs; [
        godot_4
        vim
        firefox
        git
        vesktop
        prismlauncher
        fastfetch
        (let
  rust-rover = pkgs.jetbrains.rust-rover;
in
  stdenv.mkDerivation rec {
    pname = "rust-rover-wrapped";
    version = rust-rover.version;
    patchInputs = with pkgs; [
      rustc
      cargo
      stdenv.cc.cc
      gcc
      clang
      llvm
      clippy
      cargo-generate
      nil
      nixd
      direnv
    ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    buildInputs = [ rust-rover ] ++ patchInputs;
    dontUnpack = true;
    installPhase = ''
      makeWrapper ${rust-rover}/bin/rust-rover $out/bin/rust-rover \
        --prefix PATH : ${lib.makeBinPath patchInputs}
        mkdir -p $out/share/applications
        cp ${rust-rover}/share/applications/rust-rover.desktop $out/share/applications/
    '';
  })
        zed-editor
        rustup
    ];
}
