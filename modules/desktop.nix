{
    config,
    pkgs,
    system,
    inputs,
    ...
}: {
    services.xserver = {
        enable = true;

        xkb = {
            layout = "latam";
            variant = "";
        };
    };

    security.polkit.enable = true;

    # Keyring stuff
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.sddm.enableGnomeKeyring = true;
    environment.variables.XDG_RUNTIME_DIR = "/run/user/$UID";

    # Display Manager
    services.displayManager.sddm = {
        enable = true;
        theme = "${import ./themes/sddm.nix {inherit pkgs;}}";
        wayland.enable = true;
    };

    # Compositing
    services.picom.enable = true;

    # Desktop/Window managers
    services.xserver.desktopManager.budgie.enable = true;
    services.xserver.windowManager.qtile = {
        enable = true;
        extraPackages = python3Packages:
            with python3Packages; [
                qtile-extras
            ];
    };
    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages."${system}".hyprland;
        xwayland.enable = true;
    };

    xdg.portal = {
        enable = true;
        wlr.enable = true;
        extraPortals = with pkgs; [xdg-desktop-portal-gtk];
    };

    # Theming
    qt.enable = true;
}
