{ config, pkgs, ... }: {
    home.packages = with pkgs; [
        tokyonight-gtk-theme
    ];

    gtk = {
        enable = true;
        theme.name = "Tokyonight-Dark-BL-MB";
        cursorTheme = {
            name = "Bibata-Modern-Classic";
            size = 28;
        };
        iconTheme.name = "Papirus-Dark";
    };
}
