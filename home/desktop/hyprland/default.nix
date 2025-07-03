{
    config,
    pkgs,
    inputs,
    ...
}: {
    imports = [
        ./options.nix
        ./hyprland.nix
        ./hyprpaper.nix
    ];
    # TODO: Add hypridle and hyprlock

    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;

        plugins = [
            inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
        ];
    };

    home.packages = with pkgs; [
        hyprpolkitagent
        fnott # TODO: Replace with fnott option
        hyprpicker
        hyprshot
        yazi # TODO: replace with yazi option
        btop # TODO: Replace with btop option
        wl-clipboard
    ];

    xdg.portal = {
        enable = true;
        # extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
        config.hyprland = {
            default = ["hyprland" "termfilechooser" "gtk"];
            "org.freedesktop.impl.portal.ScreenCast" = "hyprland";
            "org.freedesktop.impl.portal.FileChooser" = ["termfileschooser"];
        };
    };

    home.file."${config.hyprland.scriptsDir}" = {
        source = ./scripts;
        recursive = true;
        executable = true;
    };
}
