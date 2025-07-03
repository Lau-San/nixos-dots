{ config, pkgs, ... }: {
    wayland.windowManager.hyprland.settings = {
        general = {
            gaps_in = 6;
            gaps_out = 10;

            border_size = 3;

            "col.active_border" = "rgb(7499EC)";
            "col.inactive_border" = "rgb(222436)";

            resize_on_border = false;
            allow_tearing = false;
        };

        decoration = {
            rounding = 4;

            active_opacity = "1.0";
            inactive_opacity = "1.0";

            shadow = {
                enabled = true;
                range = 16;
                render_power = 2;
                color = "rgba(0000098a)";
                offset = "0, 5";
            };

            blur = {
                enabled = true;
                size = 4;
                passes = 2;
                noise = "0.02";
                contrast = 1;
                xray = true;
                ignore_opacity = true;
                popups = true;
            };
        };

        group = {
            "col.border_active" = "rgb(BB9AF7) rgb(89DDFF) 45deg";
            "col.border_inactive" = "rgba(1A1B26AA)";

            groupbar = {
                enabled = true;
                font_family = "Victor Mono";
                font_size = 16;
                height = 24;
                stacked = false;
                text_color = "rgb(A9B1D6)";

                "col.active" = "rgb(222436)";
                "col.inactive" = "rgba(1A1B268A)";
            };
        };

        misc = {
            force_default_wallpaper = 1;
            disable_hyprland_logo = true;
        };
    };
}

