{
    config,
    lib,
    pkgs,
    ...
}: {
    environment.systemPackages = with pkgs; [
        libsForQt5.qtstyleplugin-kvantum
        libsForQt5.qt5ct
        kdePackages.qt6ct

        libsForQt5.qt5.qtgraphicaleffects
        libsForQt5.qt5.qtquickcontrols2
    ];

    qt = {
        enable = true;
        platformTheme = "qt5ct";
        style = "kvantum";
    };
}
