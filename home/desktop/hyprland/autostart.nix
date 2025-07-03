{ config, pkgs, ... }: {
    wayland.windowManager.hyprland.settings = {
        exec = with config.hyprland.programs; [
            # Set cursor theme and size
            "hyprctl setcursor Bibata-Modern-Classic 28"

            # Set wallpaper
            "killall hyprpaper; hyprpaper"

            # Enable plugins
            # "hyprpm enable split-monitor-workspaces"

            # Notifications
            "${notif.cmd}"
        ];

        exec-once = with config.hyprland.programs; [
            "systemctl --user start hyprpolkitagent"
            "${bar.cmd}"
        ];
    };
}
