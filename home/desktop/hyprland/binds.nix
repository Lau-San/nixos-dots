{
    config,
    pkgs,
    lib,
    ...
}: let
    scriptsDirFullPath = "${config.home.homeDirectory}/${config.hyprland.scriptsDir}";

    # Make it easier to create submaps
    createSubmap = bindings: let
        processSubmapBinding = binding: "${lib.head binding}, ${lib.elemAt binding 1}, ${lib.elemAt binding 2}";
        convertToResetBinding = binding: "${lib.head binding}, ${lib.elemAt binding 1}, submap, reset";
    in
        (lib.forEach bindings processSubmapBinding)
        ++ (lib.forEach bindings convertToResetBinding)
        ++ [
            ", catchall, exec"
            ", Escape, submap, reset"
        ];
in {
    wayland.windowManager.hyprland.settings = {
        binds = {
            allow_workspace_cycles = false;
        };

        bind = with config.hyprland; [
            # Desktop
            "SUPER CTRL     , Q         , exit,"
            "SUPER CTRL     , R         , exec, hyprctl reload"
            "SUPER CTRL     , B         , exec, pkill ${programs.bar.cmd} || ${programs.bar.cmd}"
            # "SUPER CTRL     , W         , exec, killall walker; walker --gapplication-service && $notif \"Restarted Walker\" \"Walker service was restarted successfully\""
            # "SUPER CTRL     , P         , exec, sleep 1; hyprctl reload && $notif \"Reloaded Hyprpm\" \"Hyprpm packages reloaded successfully\""
            # TODO: Migrate gamemode script from old config
            # "SUPER          , G         , exec, $hypr/scripts/gamemode"

            # Apps
            "SUPER          , Return    , exec, ${terminal}"
            "SUPER          , F         , exec, ${programs.fileManager.cmd}"
            "SUPER          , B         , exec, ${programs.browser.cmd}"
            "SUPER          , Period    , exec, ${programs.systemMonitor.cmd}"
            # TODO: Add binding for music player when it's added to programs
            # "SUPER          , M         , exec, $musicPlayer"

            # Prompts/Utilities
            # TODO: Enable these after configuring Walker
            # "SUPER          , P         , exec, ${programs.menu.cmd} applications"
            "SUPER          , P         , exec, ${programs.menu.cmd} drun"
            "SUPER          , R         , exec, ${programs.menu.cmd} runner"
            # "SUPER          , O         , exec, ${programs.menu} obsidian"
            "SUPER          , Comma     , exec, ${programs.menu.cmd} projects"
            "SUPER          , Plus      , exec, ${programs.menu.cmd} calc"
            "SUPER ALT      , E         , exec, ${programs.menu.cmd} emojis"

            "SUPER          , J         , movefocus, d"
            "SUPER          , K         , movefocus, u"
            "SUPER          , H         , movefocus, l"
            "SUPER          , L         , movefocus, r"
            "SUPER CTRL     , J         , movewindow, d"
            "SUPER CTRL     , K         , movewindow, u"
            "SUPER CTRL     , H         , movewindow, l"
            "SUPER CTRL     , L         , movewindow, r"
            "SUPER CTRL     , F         , togglefloating,"
            "SUPER CTRL     , C         , killactive,"
            "SUPER CTRL     , M         , fullscreen,"

            # Groups
            "SUPER CTRL     , G         , togglegroup,"
            "SUPER CTRL     , X         , lockactivegroup,"
            "SUPER SHIFT    , H         , moveintogroup, l"
            "SUPER SHIFT    , L         , moveintogroup, r"
            "SUPER SHIFT    , J         , moveintogroup, d"
            "SUPER SHIFT    , K         , moveintogroup, u"
            "SUPER SHIFT    , O         , moveoutofgroup,"
            "SUPER          , Tab       , changegroupactive,"

            # Switch to workspace left/right
            "SUPER          , U         , split-workspace, r-1"
            "SUPER          , I         , split-workspace, r+1"

            # Switch to workspace #
            "SUPER          , 1         , split-workspace, 1"
            "SUPER          , 2         , split-workspace, 2"
            "SUPER          , 3         , split-workspace, 3"
            "SUPER          , 4         , split-workspace, 4"
            "SUPER          , 5         , split-workspace, 5"
            "SUPER          , 6         , split-workspace, 6"
            "SUPER          , 7         , split-workspace, 7"
            "SUPER          , 8         , split-workspace, 8"
            "SUPER          , 9         , split-workspace, 9"
            "SUPER          , 0         , split-workspace, 10"

            # Move active window to a workspace with mainMod + SHIFT + [0-9]
            "SUPER CTRL     , 1         , split-movetoworkspace, 1"
            "SUPER CTRL     , 2         , split-movetoworkspace, 2"
            "SUPER CTRL     , 3         , split-movetoworkspace, 3"
            "SUPER CTRL     , 4         , split-movetoworkspace, 4"
            "SUPER CTRL     , 5         , split-movetoworkspace, 5"
            "SUPER CTRL     , 6         , split-movetoworkspace, 6"
            "SUPER CTRL     , 7         , split-movetoworkspace, 7"
            "SUPER CTRL     , 8         , split-movetoworkspace, 8"
            "SUPER CTRL     , 9         , split-movetoworkspace, 9"
            "SUPER CTRL     , 0         , split-movetoworkspace, 10"

            "SUPER          , T         , togglespecialworkspace, todo"

            # Resize with right mouse button

            # Submaps
            "SUPER ALT      , C         , submap, colorpicker"
        ];

        bindm = [
            "SUPER          , mouse:272 , movewindow"
            "SUPER          , mouse:273 , resizeactive"
        ];

        # TODO: Add Config submap after adding Config Walker module and Config script
    };
}
