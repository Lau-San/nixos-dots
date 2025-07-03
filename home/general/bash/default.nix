{ config, pkgs, lib, ... }: {
    programs.bash = {
        enable = true;
        sessionVariables = {
            EDITOR = "nvim";
        };

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
        };

        initExtra =  ''
            eval $(starship init bash)
        '';
    };
}
