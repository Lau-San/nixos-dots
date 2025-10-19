{
    config,
    pkgs,
    ...
}: {
    home.packages = with pkgs; [
        # fish
        # starship
        eza
    ];

    programs.fish = {
        enable = true;

        shellAliases = {
            ".." = "cd ..";
            "..." = "cd ../..";
            c = "clear";
            h = "history";

            tree = "tree --dirsfirst -F";
            mkdir = "mkdir -p -v";
            rm = "rm -r";
            grep = "grep --color=auto";
            ls = "exa -al --color=always --icons --group-directories-first";
            cat = "bat --theme base16";

            nixrb = "git add .; sudo nixos-rebuild switch --flake .";
            nix-shell = "nix-shell --command fish";
        };

        interactiveShellInit =
            # fish
            ''
                function fish_greeting
                end

                set -g fish_key_bindings fish_vi_key_bindings
                set -g fish_sequence_key_delay_ms 200
                bind -M insert -m default jj cancel repaint-mode
            '';
    };

    # home.file.".config/fish/config.fish" = {
    #     source = ./config.fish;
    # };
}
