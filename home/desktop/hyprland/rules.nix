{
    config,
    pkgs,
    ...
}: let
    pyxelDev = "title:.*Pyxel Dev.*";
in {
    wayland.windowManager.hyprland.settings = {
        windowrule = [
            "suppressevent maximize, class:.*"

            # === UTILITIES ===

            # Flameshot
            "animation popin 100%, class:flameshot"
            "float, class:flameshot"

            # Megasync
            "float, class:nz.co.mega.megasync"
            "center, class:nz.co.mega.megasync"
            "move cursor -50% 20, class:nz.co.mega.megasync, title:MEGAsync"
            "noborder, class:nz.co.mega.megasync, title:MEGAsync"
            "noshadow, class:nz.co.mega.megasync, title:MEGAsync"
            "xray 0, class:nz.co.mega.megasync, title:MEGAsync"
            "stayfocused, class:nz.co.mega.megasync, title:MEGAsync"

            # Authenticator
            "float, class:xdg-desktop-portal-gtk"

            # Pavucontrol"
            "float, class:pavucontrol-qt"
            "float, class:pavucontrol"

            # Image viewer
            "float, class:com.interversehq.qView"

            # Anki
            "float, class:anki, title:Add"
            "float, class:anki, title:Browse.*"

            # === GAMING ===

            # Steam
            "float, class:steam, title:Steam Settings"
            "float, class:steam, title:Friends List"

            # Dolphin Emulator
            "idleinhibit, class:dolphin-emu"

            # === DEV TOOLS ===

            # Godot
            "tile, class:Godot, initialTitle:Godot"
            "float, class:Godot, title:Godot Engine - Project Manager"

            # Aseprite
            "tile, class:Aseprite"

            # Pyxel
            "monitor eDP-1, ${pyxelDev}"
            "tile, ${pyxelDev}"
            "center, ${pyxelDev}"
        ];

        layerrule = [
            # === DE ===

            # Waybar
            "blur, waybar"
            "blurpopups, waybar"
            "ignorealpha 0.4, waybar"
            "animation slide top, waybar"

            # Notifications
            "blur, notifications"
            "xray 0, notifications"
            "animation slide right, notifications"

            # Walker
            "blur, walker"
            "ignorealpha 0.4, walker"
            "xray 0, walker"
            "animation slide top, walker"
        ];
    };
}
