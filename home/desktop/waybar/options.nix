{ config, pkgs, lib, ... }: {
    options.waybar.scriptsDir = lib.mkOption {
        type = lib.types.str;
        default = ".config/waybar/scripts";
        description = "Path to directory relative to ~ containing scripts for Hyprland.";
    };
}
