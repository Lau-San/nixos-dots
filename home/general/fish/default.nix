{ config, pkgs, ... }: {
    home.packages = with pkgs; [
        fish
        starship
        eza
    ];

    home.file.".config/fish/config.fish" = {
        source = ./config.fish;
    };
}
