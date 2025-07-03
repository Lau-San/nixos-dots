{ config, pkgs, ... }:

{
    imports = [
        ./hardware.nix 
        ./modules/system.nix
        ./modules/users.nix
        ./modules/fonts.nix
        ./modules/desktop.nix
        ./modules/programs.nix
    ];

    system.stateVersion = "25.05";
}
