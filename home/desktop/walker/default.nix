{
    config,
    pkgs,
    inputs,
    ...
}: {
    home.packages = with pkgs; [
        inputs.walker.packages.${pkgs.system}.default
        libqalculate
    ];

    home.file = {
        ".config/walker/config.json".source = ./config.json;
        ".config/walker/themes/tokyonight.json".source = ./themes/tokyonight.json;
        ".config/walker/themes/tokyonight.css".source = ./themes/tokyonight.css;
        ".config/walker/plugins/projects_schema.json".source = ./plugins/projects_schema.json;
        ".config/walker/plugins/projects.py".source = ./plugins/projects.py;
    };
}
