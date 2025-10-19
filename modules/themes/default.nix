{
    config,
    lib,
    pkgs,
    ...
}: {
    imports = [
        # ./gtk.nix
        # ./qt.nix
        ./stylix.nix
    ];
}
