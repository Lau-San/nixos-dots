{ config, pkgs, inputs, ... }:
{
    config.hyprland.terminal = "${pkgs.kitty}/bin/kitty";

    config.hyprland.programs = with pkgs; {
        bar.cmd = "${waybar}/bin/waybar";
        notif.cmd = "${fnott}/bin/fnott";
        menu.cmd = "${inputs.walker.packages.${system}.default}/bin/walker --theme=${config.hyprland.theme} -m";

        editor.cmd = "${neovim}/bin/nvim";
        browser.cmd = "${inputs.zen-browser.packages.${system}.default}/bin/zen";

        fileManager = {
            cmd = "${yazi}/bin/yazi";
            term = true;
        };
        systemMonitor = {
            cmd = "${btop}/bin/btop";
            term = true;
        };
    };
}
