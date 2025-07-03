{ config, pkgs, ... }: {
    wayland.windowManager.hyprland.settings = {
        input = {
            kb_layout = "latam";
            kb_options = "ctrl:swapcaps";

            follow_mouse = 1;
            sensitivity = 0;

            touchpad = {
                natural_scroll = true;
            };

            tablet = {
                output = "eDP-1";
            };
        };
    };
}
