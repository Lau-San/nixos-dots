{ config, pkgs, inputs, ... }:
{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings.trusted-users = [ "root" "laura" "@wheel" ];

    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    # Bootloader.
    # boot.loader.systemd-boot.enable = true;
    # boot.loader.efi.canTouchEfiVariables = true;
    boot.loader = {
        timeout = 10;
        efi = {
            efiSysMountPoint = "/boot";
            canTouchEfiVariables = true;
        };
        grub = {
            enable = true;
            efiSupport = true;
            device = "nodev";
            useOSProber = true;
        };
    };

    # Networking
    networking.hostName = "nixos"; # Define your hostname.
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "America/Lima";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocales = [ "en_GB.UTF-8/UTF-8" ];

    # Configure console keymap
    console.keyMap = "la-latin1";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };
}
