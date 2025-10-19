{
    config,
    pkgs,
    ...
}: {
    imports = [
        ./themes
        ./system.nix
        ./users.nix
        ./fonts.nix
        ./desktop.nix
        ./programs.nix
    ];

    system.stateVersion = "25.05";
}
