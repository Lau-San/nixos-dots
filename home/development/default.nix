{
    config,
    pkgs,
    ...
}: {
    imports = [
        ./git.nix
        ./neovim
        ./zellij
    ];

    home.packages = with pkgs; [
        # Nix tools
        nix-prefetch-scripts
        nix-prefetch-github
        devenv

        # Build tools
        gnumake
        gcc
        cmake
        ninja

        # Languages
        lua51Packages.lua
        (python3.withPackages
        (p:
            with p; [
                fastjsonschema
            ]))

        # Package managers
        lua51Packages.luarocks

        # Scripts
        (writeScriptBin "colorutils" (builtins.readFile ./scripts/colorutils))
        (writeScriptBin "msgutils" (builtins.readFile ./scripts/msgutils))
        (writeScriptBin "newproject" (builtins.readFile ./scripts/newproject))
    ];

    programs.direnv.enable = true;
    programs.direnv.config = {
        hide_env_diff = true;
    };
}
