{ config, pkgs, lib, inputs, ... }: {
    options.hyprland.theme = lib.mkOption {
        type = lib.types.enum [ "tokyonight" ];
        default = "tokyonight";
        description = "The theme to use for Hyprland and other programs.";
    };

    options.hyprland.scriptsDir = lib.mkOption {
        type = lib.types.str;
        default = ".config/hypr/scripts";
        description = "Path to directory relative to ~ containing scripts for Hyprland.";
    };

    options.hyprland.terminal = lib.mkOption {
        type = lib.types.str;
        default = "${pkgs.kitty}/bin/kitty";
        description = "Default terminal emulator.";
    };

    options.hyprland.programs =
        let
            # Function that generates a command that runs in a terminal emulator
            termCmd = cmd:
                if lib.hasSuffix "kitty" config.hyprland.terminal then "${config.hyprland.terminal} ${cmd}"
                else if lib.hasSuffix "alacritty" config.hyprland.terminal then "${config.hyprland.terminal} -e ${cmd}"
                else throw "Unsuported terminal emulator: ${config.hyprland.terminal}";
        in lib.mkOption {
        type = lib.types.attrsOf (lib.types.submodule ({ config, ... }: {
            options = {
                cmd = lib.mkOption {
                    type = lib.types.str;
                    description = "The binary file to execute.";
                    apply = val: if config.term then termCmd val else val;
                };
                term = lib.mkOption {
                    type = lib.types.bool;
                    default = false;
                    description = "Whether the command should run in a terminal emulator.";
                };
            };
            # config = {
            #     cmd =
            #         if config.term then
            #             if lib.hasSuffix "kitty" config.hyprland.terminal then "${config.hyprland.terminal} ${config.cmd}"
            #             else if lib.hasSuffix "alacritty" config.hyprland.terminal then "${config.hyprland.terminal} -e ${config.cmd}"
            #             else throw "Unsuported terminal emulator: ${config.hyprland.terminal}"
            #         else config.cmd;
            # };
        }));
        default = {};
    };
}
