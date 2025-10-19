{
    config,
    pkgs,
    ...
}: {
    # imports = [
    #     ./gtk.nix
    #     ./qt.nix
    # ];

    # home.packages = with pkgs; [
    #     bibata-cursors
    #     papirus-icon-theme
    # ];

    # home.pointerCursor = {
    #     enable = true;
    #     name = "Bibata-Modern-Classic";
    #     package = pkgs.bibata-cursors;
    #     size = 28;
    # };

    stylix.icons = {
        enable = true;
        package = pkgs.papirus-icon-theme;
        dark = "Papirus-Dark";
        light = "Papirus-Light";
    };
}
