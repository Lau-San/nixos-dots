{
    config,
    pkgs,
    ...
}: let
in {
    # home.packages = [pkgs.chafa];

    home.file.".config/fastfetch/logo.png".source = ./logo.png;

    programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                source = "logo.png";
                padding = {
                    top = 0;
                    left = 0;
                    right = 0;
                };
            };
            display = {
                separator = "  ";
                key = {
                    width = 8;
                };
                color = {
                    keys = "blue";
                    separator = "blue";
                    output = "white";
                };
            };
            modules = [
                "break"
                {
                    type = "custom";
                    format = "┌─────────────────────────────────────────────────────────┐";
                    outputColor = "blue";
                }
                {
                    type = "title";
                    key = "   ";
                    format = "{6}{7}{8}";
                    keyColor = "magenta";
                }
                {
                    type = "custom";
                    format = "└─────────────────────────────────────────────────────────┘";
                    outputColor = "blue";
                }
                {
                    type = "custom";
                    format = "┌─────────────────────────────────────────────────────────┐";
                    outputColor = "blue";
                }
                {
                    type = "de";
                    key = "  󱄄 ";
                    format = "{2}";
                    keyColor = "green";
                }
                {
                    type = "wm";
                    key = "   ";
                    format = "{2} ({3})";
                    keyColor = "green";
                }
                {
                    type = "terminal";
                    key = "   ";
                    format = "{5} {6}";
                    keyColor = "green";
                }
                {
                    type = "shell";
                    key = "   ";
                    format = "{6} {4}";
                    keyColor = "green";
                }
                {
                    type = "theme";
                    key = "   ";
                    format = "{2}";
                    keyColor = "green";
                }
                {
                    type = "cursor";
                    key = "   ";
                    format = "{1} ({2}px)";
                    keyColor = "green";
                }
                {
                    type = "icons";
                    key = "   ";
                    format = "{2}";
                    keyColor = "green";
                }
                {
                    type = "custom";
                    format = "└─────────────────────────────────────────────────────────┘";
                    outputColor = "blue";
                }
                {
                    type = "custom";
                    format = "┌─────────────────────────────────────────────────────────┐";
                    outputColor = "blue";
                }
                {
                    type = "cpu";
                    key = "   ";
                    format = "{1} ({3})";
                    keyColor = "yellow";
                }
                {
                    type = "disk";
                    key = "  󰋊 ";
                    format = "{1} / {2} ({6})";
                    keyColor = "yellow";
                }
                {
                    type = "memory";
                    key = "   ";
                    format = "{1} / {2} ({3})";
                    keyColor = "yellow";
                }
                {
                    type = "gpu";
                    key = "  󱎴 ";
                    format = "{1} {2} ({3})";
                    keyColor = "yellow";
                }
                {
                    type = "display";
                    key = "  󰍹 ";
                    format = "{6} {1}x{2} @ {3}Hz";
                    keyColor = "yellow";
                }
                {
                    type = "gamepad";
                    key = "  󰊴 ";
                    format = "{1}";
                    keyColor = "yellow";
                }
                {
                    type = "custom";
                    format = "└─────────────────────────────────────────────────────────┘";
                    outputColor = "blue";
                }
                {
                    type = "custom";
                    format = "                  {#90}  {#31}  {#32}  {#33}  {#34}  {#35}  {#36}  {#37} ";
                }
            ];
        };
    };
}
