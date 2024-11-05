{ pkgs, lib, ... }:
{
    xsession.windowManager.i3 = {
        enable = true;
        config = let
            foreground      = "#a9b1d6";
            foreground2     = "#bbc2cf";
            background      = "#24283b";

            black           = "#414868";
            red             = "#f7768e";
            green           = "#9ece6a";
            yellow          = "#e0af68";
            blue            = "#7aa2f7";
            magenta         = "#bb9af7";
            cyan            = "#7dcfff";
            white           = "#e5e9f0";

            alert           = "#bd2c40";
        in rec {
            modifier = "Mod4";
            startup = [
                { command = "dex --autostart --environment i3"; notification = false; }
                { command = "feh --bg-fill ~/Pictures/Wallpapers/wallpaper.jpg"; always = true; notification = false; }
                { command = "xss-lock --transfer-sleep-lock -- i3lock --nofork"; always = true; notification = false; }
                { command = "setxkbmap us intl"; always = true; notification = false; }
                { command = "picom -b"; always = true; notification = false; }
            ];
            keybindings = lib.mkOptionDefault {
                "${modifier}+Return" = "exec i3-sensible-terminal";
                "${modifier}+q" = "kill";
                "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun";
                "${modifier}+r" = "exec ${pkgs.rofi}/bin/rofi -show run";
                "${modifier}+x" = "exec i3lock -i ~/Pictures/Wallpapers/lock.png";
                "${modifier}+p" = "exec ~/.config/rofi/leave.sh";
            };
            gaps = {
                outer = 5;
                inner = 6;
            };
            bars = [{
                position = "top";
                trayOutput = "primary";
                statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-default.toml";

                fonts = {
                    names = [ "IosevkaTerm Nerd Font" ];
                    style = "Bold";
                    size = 11.0;
                };
            }];
            window.titlebar = false;
            window.border = 3;
            floating.border = 1;
            colors = {
                focused = {
                    border = "${magenta}";
                    background = "${magenta}";
                    text = "${foreground}";
                    indicator = "${foreground2}";
                    childBorder = "${magenta}";
                };
                focusedInactive = {
                    border = "${black}";
                    background = "${black}";
                    text = "${foreground}";
                    indicator = "${foreground2}";
                    childBorder = "${cyan}";
                };
                unfocused = {
                    border = "${blue}";
                    background = "${blue}";
                    text = "${foreground}";
                    indicator = "${foreground2}";
                    childBorder = "${blue}";
                };
                urgent = {
                    border = "${red}";
                    background = "${red}";
                    text = "${foreground}";
                    indicator = "${foreground2}";
                    childBorder = "${red}";
                };
            };
            focus = {
                followMouse = false;
            };
        };
    };
}
