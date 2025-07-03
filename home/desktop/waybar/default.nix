{ config, pkgs, inputs, ... }: {

    imports = [ ./options.nix ];

    programs.waybar = {
        enable = true;
        package = inputs.waybar.packages.${pkgs.system}.waybar;
    };

    home.packages = with pkgs; [
        cava
        font-awesome
        jq
        playerctl
    ];

    # I'm just copying the config files instead of nixifying the config cuz I'm lazy lol
    home.file.".config/waybar/config.jsonc".source = ./config.jsonc;
    home.file.".config/waybar/modules".source = ./modules;
    home.file.".config/waybar/style.css".source = ./style.css;
    home.file."${config.waybar.scriptsDir}" = {
        source = ./scripts;
        recursive = true;
        executable = true;
    };
}
