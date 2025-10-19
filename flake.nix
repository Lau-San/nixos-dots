{
    description = "My NixOS configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        base16.url = "github:SenchoPens/base16.nix";
        stylix = {
            url = "github:danth/stylix/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "github:hyprwm/Hyprland?rev=71a1216abcc7031776630a6d88f105605c4dc1c9";
        split-monitor-workspaces = {
            url = "github:Duckonaut/split-monitor-workspaces?rev=6af9cdf7d739e667c638b1ac10fec0ba7ba6b86c";
            inputs.hyprland.follows = "hyprland";
        };

        waybar.url = "github:Alexays/Waybar/master";
        walker.url = "github:abenz1267/walker";

        zjstatus.url = "github:dj95/zjstatus";

        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake/d90982fa0964c701abce2d8968f9a08f2e15d55a";
        };
    };

    outputs = {
        self,
        nixpkgs,
        home-manager,
        base16,
        stylix,
        ...
    } @ inputs: let
        system = "x86_64-linux";
    in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit system inputs;};
            modules = [
                base16.nixosModule
                stylix.nixosModules.stylix
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
