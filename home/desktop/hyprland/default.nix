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
        # hyprpolkitagent
        fnott # TODO: Replace with fnott option
        hyprpicker
        hyprshot
        yazi # TODO: replace with yazi option
        wl-clipboard
    ];

    home.file."${config.hyprland.scriptsDir}" = {
        source = ./scripts;
        recursive = true;
        executable = true;
    };
}
