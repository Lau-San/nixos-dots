{
    config,
    pkgs,
    lib,
    ...
}: {
    programs.starship = {
        enable = true;

        enableBashIntegration = true;
        enableFishIntegration = true;

        # settings = lib.importTOML ./starship.toml;
        settings = {
            add_newline = true;
            command_timeout = 3000;
            scan_timeout = 100;

            format = lib.concatStrings [
                "$directory($git_branch$git_status)"
                "$python"
                "$nix_shell"
                "$nodejs"
                "$lua"
                "$shell"
                "$line_break"
                " $character"
            ];

            character = {
                success_symbol = "[](green)";
                error_symbol = "[](red)";
                vicmd_symbol = "[](purple)";
            };

            shell = {
                style = "bg:purple fg:black";
                bash_indicator = " ";
                fish_indicator = " ";
                format = "[](fg:purple)[ $indicator]($style)[](fg:purple)";
            };

            directory = {
                style = "fg:cyan";
                home_symbol = " ";
                read_only = " ";
                read_only_style = "bg:17 fg:black";
                format = lib.concatStrings [
                    "([](fg:17)[ $read_only ]($read_only_style)[](fg:17))"
                    "[ $path ]($style)"
                ];
                repo_root_style = "bg:cyan fg:black bold";
                repo_root_format = lib.concatStrings [
                    "[](fg:cyan)[  $repo_root ]($repo_root_style)[](bg:black fg:cyan)"
                    "([ $path ]($style))"
                ];
                fish_style_pwd_dir_length = 2;
            };

            git_branch = {
                style = "bg:blue fg:black";
                symbol = " ";
                format = "[](fg:blue)[ $symbol$branch ]($style)[](fg:blue)";
            };

            git_commit = {
                style = "blue";
                only_detached = false;
                tag_disabled = false;
                format = " []($style bold) [$hash$tag]($style dimmed)";
            };

            git_status = {
                style = "bg:black";
                modified = "[ ](bg:black fg:yellow)";
                renamed = "[ ](bg:black fg:blue)";
                deleted = "[ ](bg:black fg:red)";
                staged = "[ ](bg:black fg:green)";
                untracked = "[](bg:black fg:red)";
                conflicted = "[ ](bg:black fg:red)";
                ahead = "[](bg:black fg:17) ";
                behind = "[](bg:black fg:red) ";
                format = "[( ($ahead_behind )$all_status )]($style)[](fg:blue)";
            };

            nix_shell = {
                impure_msg = "";
                pure_msg = "";
                style = "bg:blue fg:black bold";
                symbol = " ";
                format = "([](fg:blue)[ $symbol$name$state ]($style)[](fg:blue))";
            };

            python = {
                style = "bg:yellow fg:black";
                symbol = " ";
                python_binary = ["python3" "python"];
                format = "([](fg:yellow)[ $symbol$version( $virtualenv) ]($style)[](fg:yellow))";
            };

            nodejs = {
                format = "([](fg:green)[ $symbol$version ]($style)[](fg:green))";
                style = "bg:green fg:black";
                symbol = "󰎙 ";
            };

            cmd_duration = {
                disabled = true;
            };
        };
    };
}
