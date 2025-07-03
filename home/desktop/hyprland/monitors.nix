{ config, pkgs, ... }: {
    wayland.windowManager.hyprland.settings = {
        monitor = [
            "eDP-1,   1920x1080@60,   0x0,    1"
            "HDMI-A-1,  1600x900@60,    1920x0, 1"
        ];
    };
}
