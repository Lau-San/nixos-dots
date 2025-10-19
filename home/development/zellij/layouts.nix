{
    pkgs,
    config,
    ...
}: {
    home.file = {
        ".config/zellij/layouts/pyxel.kdl".text =
            #kdl
            ''
                layout {
                    default_tab_template {
                        ${config.zellij.statusbar}
                        children
                    }

                    tab name="Code" split_direction="vertical" focus=true {
                        pane name="Code" borderless=true {
                            // NOTE: This works for the most part but it for some reasin breaks
                            // blink.cmp bindings for next and previous suggestions...
                            // command "direnv"
                            // args "" "direnv reload && nvim"
                        }
                    }
                    tab name="Watch" {
                        pane borderless=true command="direnv" {
                            args "exec" "." "devenv" "up"
                        }
                    }
                    tab name="Lazygit" {
                        pane borderless=true command="lazygit"
                    }
                    tab name="Terminal" {
                        pane borderless=true
                    }
                }
            '';
    };
}
