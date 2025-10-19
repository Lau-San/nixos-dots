{
    config,
    pkgs,
    ...
}: {
    wayland.windowManager.hyprland.settings = {
        exec = with config.hyprland.programs; [
            # Set cursor theme and size
            "hyprctl setcursor Bibata-Modern-Classic 28"
            # "gsettings set org.gnome.interface cursor-theme 'Bibata-Modern-Classic'"
            # "gsettings set org.gnome.interface cursor-size 28"

            # Set wallpaper
            "killall hyprpaper; hyprpaper"

            # Enable plugins
            # "hyprpm enable split-monitor-workspaces"

            # Notifications
            "${notif.cmd}"
        ];

        exec-once = with config.hyprland.programs; [
            "${bar.cmd}"
            "systemctl --user start plasma-polkit-agent"
        ];
    };
}
