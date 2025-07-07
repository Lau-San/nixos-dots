{ config, pkgs, system, inputs,... }: {
    services.xserver = {
        enable = true;

        xkb = {
            layout = "latam";
            variant = "";
        };
    };

    security.polkit.enable = true;

    # Display Manager
    services.displayManager.sddm.enable = true;

    # Compositing
    services.picom.enable = true;

    # Desktop/Window managers
    services.xserver.desktopManager.budgie.enable = true;
    services.xserver.windowManager.qtile = {
        enable = true;
        extraPackages = python3Packages: with python3Packages; [
            qtile-extras
        ];
    };
    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages."${system}".hyprland;
    };

    # Theming
    qt.enable = true;
}
