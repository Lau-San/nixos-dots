{ config, pkgs, ... }:
{
    fonts.fontconfig.enable = true;

    fonts.packages = with pkgs; [
        victor-mono
        nerd-fonts.mononoki
        noto-fonts-color-emoji
    ];
}
