{
    config,
    pkgs,
    inputs,
    ...
}: {
    imports = [
        ./bash
        ./fish
        ./starship
        ./kitty
        ./fastfetch
    ];

    home.packages = with pkgs; [
        zoxide
        bat

        inputs.zen-browser.packages.${pkgs.system}.default
        lxqt.pavucontrol-qt
        zotero
        golly
    ];
}
