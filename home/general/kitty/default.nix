{ config, pkgs, ... }: {
    programs.kitty = {
        enable = true;
        extraConfig = builtins.readFile ./kitty.conf;
    };

    home.file.".config/kitty/theme.conf" = {
        source = ./theme.conf;
    };
}
