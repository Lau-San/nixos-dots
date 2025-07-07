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
                        pane name="Code" borderless=true command="direnv" {
                            args "exec" "." "nvim"
                        }
                    }
                    tab name="Watch" {
                        pane borderless=true command="direnv" {
                            args "exec" "." "devenv" "up"
                        }
                    }
                    tab name="Terminal" {
                        pane borderless=true
                    }
                }
            '';
    };
}
