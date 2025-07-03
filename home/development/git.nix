{ config, pkgs, ... }: {
    home.packages = with pkgs; [
        gh
    ];

    programs.git = {
        enable = true;
        userName = "Lau-San";
        userEmail = "lausanch0512@gmail.com";

        extraConfig = {
            init = { defaultBranch = "main"; };
        };
    };
}
