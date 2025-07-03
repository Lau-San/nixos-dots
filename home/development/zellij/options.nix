{
    config,
    pkgs,
    lib,
    inputs,
    ...
}: {
    options.zellij.statusbar = lib.mkOption {
        type = lib.types.lines;
        default =
            #kdl
            ''
                pane size=1 borderless=true {
                    plugin location="file:${inputs.zjstatus.packages.${pkgs.system}.default}/bin/zjstatus.wasm" {
                        // COLORS
                        color_bg        "#181926"
                        color_black     "#12131D"
                        color_gray      "#2F334D"
                        color_white     "#C6D1F3"
                        color_bluegray  "#636DA6"
                        color_magenta   "#BA99F7"
                        color_blue      "#89B4FA"
                        color_jade      "#4CCBB7"
                        color_cyan      "#89DDFF"
                        color_green     "#A1D072"
                        color_yellow    "#E0AF68"
                        color_orange    "#EC935E"
                        color_red       "#F7768E"

                        hide_frame_for_single_pane "true"

                        format_left   "{mode}{tabs}"
                        format_center ""
                        format_right  "#[fg=$blue,bg=$black]    {session} #[bg=$blue] "
                        format_space  "#[bg=$bg]"
                        format_hide_on_overlength "true"
                        format_precedence "crl"

                        border_enabled  "false"
                        border_char     "─"
                        border_format   "#[fg=#2F334D]"
                        border_position "bottom"

                        mode_normal        "#[fg=$black,bg=$jade,bold] NORMAL "
                        mode_locked        "#[fg=$bluegray,bg=$gray,bold]  LOCKED "
                        mode_pane          "#[fg=$black,bg=$blue,bold] PANE "
                        mode_rename_pane   "#[fg=$black,bg=$magenta,bold] RENAME-PANE "
                        mode_move          "#[fg=$black,bg=$magenta,bold] MOVE "
                        mode_resize        "#[fg=$black,bg=$red,bold] RESIZE "
                        mode_tab           "#[fg=$black,bg=$yellow,bold] TAB "
                        mode_rename_tab    "#[fg=$black,bg=$orange,bold] RENAME-TAB "
                        mode_prompt        "#[fg=$black,bg=$green,bold] PROMPT "
                        mode_session       "#[fg=$black,bg=$cyan,bold] SESSION "
                        mode_scroll        "#[fg=$black,bg=$bluegray,bold] SCROLL "
                        mode_enter_search  "#[fg=$black,bg=$white,bold] ENT-SEARCH "
                        mode_search        "#[fg=$black,bg=$white,bold] SEARCHARCH "

                        tab_normal              "#[bg=$black,fg=#636DA6]  {index} {name} {floating_indicator}  "
                        tab_normal_fullscreen   "#[bg=$black,fg=#636DA6]  {index} {name} {fullscreen_indicator}  "
                        tab_normal_sync         "#[bg=$black,fg=#636DA6]  {index} {name} {sync_indicator}  "
                        tab_active              "#[bg=$black,fg=#4CCBB7,bold,italic,underscore]  {index} {name} {floating_indicator}  "
                        tab_active_fullscreen   "#[bg=$black,fg=#4CCBB7,bold,italic,underscore]  {index} {name} {fullscreen_indicator}  "
                        tab_active_sync         "#[bg=$black,fg=#4CCBB7,bold,italic,underscore]  {index} {name} {sync_indicator}  "

                        // separator between the tabs
                        tab_separator           ""

                        // indicators
                        tab_sync_indicator       " "
                        tab_fullscreen_indicator " 󰊓"
                        tab_floating_indicator   " 󰹙"

                        command_git_branch_command     "git rev-parse --abbrev-ref HEAD"
                        command_git_branch_format      "#[fg=blue] {stdout} "
                        command_git_branch_interval    "10"
                        command_git_branch_rendermode  "static"

                        datetime        "#[fg=#6C7086,bold] {format} "
                        datetime_format "%A, %d %b %Y %H:%M"
                    }
                }
            '';
    };
}
