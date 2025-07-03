{ config, pkgs, ... }: {
    imports = [
        ./gtk.nix
        ./qt.nix
    ];

    home.packages = with pkgs; [
        bibata-cursors
        papirus-icon-theme
    ];
}
