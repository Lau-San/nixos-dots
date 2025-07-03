{
    config,
    pkgs,
    inputs,
    lib,
    ...
}: {
    imports = [
        ./options.nix
        ./layouts.nix
    ];

    programs.zellij = {
        enable = true;
        enableFishIntegration = true;
    };

    home.file.".config/zellij/config.kdl".source = ./config.kdl;
    home.file.".config/zellij/layouts/default.kdl".text =
        # kdl
        ''
            layout {
                default_tab_template {
                    ${config.zellij.statusbar}
                    children
                }
            }
        '';
}
