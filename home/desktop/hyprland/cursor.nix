{ config, pkgs, ... }: {
    wayland.windowManager.hyprland.settings = {
        cursor = {
            no_warps = false;
            default_monitor = "eDP-1";
            hide_on_key_press = true;
            inactive_timeout = 5;
        };
    };
}
