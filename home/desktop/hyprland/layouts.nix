{ config, pkgs, ... }: {
    wayland.windowManager.hyprland.settings = {
        general = {
            layout = "master";
        };

        dwindle = {
            pseudotile = true;
            preserve_split = true;
            force_split = 2;
        };

        master = {
            new_status = "inherit";
            mfact = "0.5";
            # no_gaps_when_only = 0
        };
    };
}
