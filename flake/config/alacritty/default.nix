{ ... }:
{
    programs.alacritty = {
        enable = true;
        settings = let
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
            font = {
                normal = {
                    family = "IosevkaTerm Nerd Font";
                    style = "Bold";
                };
                size = 14.0;
            };
            window.opacity = 0.9;
            env.TERM = "xterm-256color";
            colors = {
                primary = {
                    foreground = "${foreground}";
                    background = "${background}";
                };
                normal = {
                    black = "${black}";
                    red = "${red}";
                    green = "${green}";
                    yellow = "${yellow}";
                    blue = "${blue}";
                    magenta = "${magenta}";
                    cyan = "${cyan}";
                    white = "${white}";
                };
            };
        };
    };
}
