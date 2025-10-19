{
    config,
    pkgs,
    ...
}: {
    imports = [
        ./hardware.nix
        ./modules
    ];

    system.stateVersion = "25.05";
}
