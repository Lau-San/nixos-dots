{
    config,
    pkgs,
    ...
}: {
    environment.systemPackages = with pkgs; [
        libsForQt5.qt5.qtgraphicaleffects
    ];

    stylix = {
        enable = true;

        base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";
        # override = {
        #     white = "base07";
        # };
        image = ../../home/desktop/wallpapers/tokyonight.png;
        polarity = "dark";

        cursor = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Classic";
            size = 28;
        };

        targets.grub.useWallpaper = true;
    };
}
