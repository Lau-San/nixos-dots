{ config, pkgs, ... }: {
    imports = [
        ./monitors.nix
        ./programs.nix
        ./autostart.nix
        ./lookAndFeel.nix
        ./animations.nix
        ./layouts.nix
        ./cursor.nix
        ./input.nix
        ./binds.nix
        ./rules.nix
    ];

    wayland.windowManager.hyprland.settings = {
        xwayland = {
            force_zero_scaling = true;
        };

        plugin = {
            split-monitor-workspaces = {
                count = 10;
                keep_focused = 1;
            };
        };

        env = [
            "XCURSOR_SIZE, 28"
            "HYPRCURSOR_SIZE, 28"

            "XDG_CURRENT_DESKTOP, Hyprland"
            "XDG_SESSION_TYPE, wayland"
            "XDG_SESSION_DESKTOP, Hyprland"

            "QT_QPA_PLATFORM, wayland"
            "QT_QPA_PLATFORMTHEME, qt6ct"

            "GDK_SCALE, 1"
            "MOZ_ENABLE_WAYLAND, 1"

            "GBM_BACKEND, nvidia-drm"
            "LIBVA_DRIVER_NAME, nvidia"
            "__GLX_VENDOR_LIBRARY_NAME, nvidia"
        ];

    };
}
