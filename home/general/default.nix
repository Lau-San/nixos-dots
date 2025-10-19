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
        ./btop
        ./fastfetch

        inputs.zen-browser.homeModules.beta
    ];

    home.packages = with pkgs; [
        bat

        mediastreamer-openh264
        lxqt.pavucontrol-qt
        zotero
        foliate
        golly
        brave
        discord
        transmission_4
        mpv
        obsidian
    ];

    programs.zen-browser.enable = true;

    programs.zoxide = {
        enable = true;
        enableFishIntegration = true;
        enableBashIntegration = true;
        options = [
            "--cmd cd"
        ];
    };
}
