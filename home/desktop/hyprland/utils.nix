{ config, pkgs, ... }: let
    screenshotTool = rec {
        dir = "${config.home.homeDirectory}/Pictures/screenshots";
        cmd = "${pkgs.hyprshot}/bin/hyprshot";
        activeMonitorFlags = "-m output -m active";
        regionFlags = "-m region";
        copyFlags = "--clipboard-only";
        dirEnv = "HYPRSHOT_DIR=${dir}";
    };
in {
    screenshot = with screenshotTool; {
        currentMonitor = {
            copy = "${cmd} ${activeMonitorFlags} ${copyFlags}";
            save = "${dirEnv} ${cmd} ${activeMonitorFlags}";
        };
        region = {
            copy = "${cmd} ${regionFlags} ${copyFlags}";
            save = "${dirEnv} ${cmd} ${regionFlags}";
        };
    };

    # TODO: Configure screen recording tool
}
