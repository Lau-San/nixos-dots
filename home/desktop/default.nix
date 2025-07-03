{ config, pkgs, inputs, ... }:
{
    imports = [
        ./options.nix
        ./desktopPortals.nix
        ./themes
        ./hyprland
        ./waybar
        ./walker
    ];

    home.file."${config.wallpapersDir}" = {
        source = ./wallpapers;
    };

}
