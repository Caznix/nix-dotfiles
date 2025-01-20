{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Caznix";
    userEmail = "Caznix01@gmail.com";
    extraConfig = {
       push = { autoSetupRemote = true; };
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}