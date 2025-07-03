{ config, lib, pkgs, ... }:
let
    kvTokyoNight = pkgs.fetchFromGitHub {
        owner = "0xsch1zo";
        repo = "Kvantum-Tokyo-Night";
        rev = "82d104e0047fa7d2b777d2d05c3f22722419b9ee";
        hash = "sha256-Uy/WthoQrDnEtrECe35oHCmszhWg38fmDP8fdoXQgTk=";
    };
in
{
    home.packages = with pkgs; [
        libsForQt5.qtstyleplugin-kvantum
        libsForQt5.qt5ct
        kdePackages.qt6ct
        libsForQt5.qt5.qtgraphicaleffects
        libsForQt5.qt5.qtquickcontrols2
        libsForQt5.qt5.qtquickcontrols
    ];

    qt = {
        enable = true;
        platformTheme.name = "qtct";
        style.name = "kvantum";
    };

    home.sessionVariables = {
        QT_QPA_PLATFORMTHEME = lib.mkForce "qt6ct";
        QT_STYLE_OVERRIDE = "kvantum";
    };

    home.file.".config/Kvantum/Kvantum-Tokyo-Night" = {
        source = "${kvTokyoNight}/Kvantum-Tokyo-Night";
        recursive = true;
    };

    home.file.".config/Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=Kvantum-Tokyo-Night
    '';

    home.file.".config/qt6ct/qt6ct.conf".text = ''
        [Appearance]
        icon_theme=Papirus-Dark
        standard_dialogs=kde
        style=kvantum
    '';

    home.file.".config/qt5ct/qt5ct.conf".text = ''
        [Appearance]
        icon_theme=Papirus-Dark
        standard_dialogs=default
        style=kvantum
    '';
}
