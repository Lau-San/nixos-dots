{
    config,
    pkgs,
    inputs,
    ...
}: {
    imports = [
        ./general
        ./desktop
        ./development
        ./gaming
    ];

    home.username = "laura";
    home.stateVersion = "25.05";
}
