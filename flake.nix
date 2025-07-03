{
    description = "My NixOS configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "github:hyprwm/Hyprland";
        split-monitor-workspaces = {
            url = "github:Duckonaut/split-monitor-workspaces";
            inputs.hyprland.follows = "hyprland";
        };

        waybar.url = "github:Alexays/Waybar/master";
        walker.url = "github:abenz1267/walker";

        zjstatus.url = "github:dj95/zjstatus";

        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {
        self,
        nixpkgs,
        home-manager,
        ...
    } @ inputs: let
        system = "x86_64-linux";
    in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit system inputs;};
            modules = [
                ./configuration.nix

                home-manager.nixosModules.home-manager
                {
                    home-manager.extraSpecialArgs = {inherit system inputs;};

                    home-manager.useUserPackages = true;
                    home-manager.useGlobalPkgs = true;

                    home-manager.users.laura = import ./home;
                }
            ];
        };
    };
}
