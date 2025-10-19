{
    config,
    pkgs,
    lib,
    inputs,
    ...
}: {
    imports = [./options.nix];

    home.packages = with pkgs; [
        cava
        font-awesome
        jq
        playerctl
    ];

    stylix.targets.waybar.enable = false;
    programs.waybar = {
        enable = true;
        package = inputs.waybar.packages.${pkgs.system}.waybar;
        style = builtins.readFile ./style.css;
    };

    # I'm just copying the config files instead of nixifying the config cuz I'm lazy lol
    home.file.".config/waybar/config.jsonc".source = ./config.jsonc;
    home.file.".config/waybar/modules".source = ./modules;
    # home.file.".config/waybar/style.css".source = ./style.css;
    home.file."${config.waybar.scriptsDir}" = {
        source = ./scripts;
        recursive = true;
        executable = true;
    };
}
