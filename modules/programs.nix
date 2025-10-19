{
    config,
    pkgs,
    ...
}: {
    nixpkgs.config.allowUnfree = true;

    programs.git.enable = true;
    # programs.bat.enable = true;
    # programs.zoxide.enable = true;
    programs.fish.enable = true;
    # programs.starship.enable = true;
    programs.firefox.enable = true;
    programs.steam.enable = true;
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        configure = {
            customRC = ''
                imap jj <Esc>

                set tabstop=4
                set shiftwidth=4
            '';
        };
    };

    environment.systemPackages = with pkgs; [
        tree
        gh
        home-manager
        nemo-with-extensions
        libsForQt5.polkit-kde-agent
        ffmpeg-full
        mangohud
        goverlay
        vulkan-tools
    ];
}
