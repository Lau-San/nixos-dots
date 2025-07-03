{ config, pkgs, ... }:
let
    # Set the wallpaper here!
    wp = "tokyonight.png";
in
{
    services.hyprpaper = {
        enable = true;

        settings = {
            preload = "${config.wallpapersDir}/${wp}";
            wallpaper = ", ${config.wallpapersDir}/${wp}";
        };
    };
}
