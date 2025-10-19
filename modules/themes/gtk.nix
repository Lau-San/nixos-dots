{
    config,
    lib,
    pkgs,
    ...
}: {
    environment.systemPackages = with pkgs; [
        bibata-cursors
    ];

    environment.etc = {
        "xdg/gtk-3.0/settings.ini".text = ''
            [Settings]
            gtk-cursor-theme-name=Bibata-Modern-Classic
            gtk-cursor-theme-size=28
        '';
        "xdg/gtk-2.0/gtkrc".text = ''
            gtk-cursor-theme-name="Bibata-Modern-Classic"
            gtk-cursor-theme-size=28
        '';
    };
}
