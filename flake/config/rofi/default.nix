{ pkgs, config, ... }:

{
    programs.rofi = {
        enable = true;
        extraConfig = {
            font = "IosevkaTerm Nerd Font Medium 15";
            modi = "drun,run,window";
            display-drun = "[ ]";
            display-run = "[ ]";
            display-window = "[ ]";
        };
        theme = let 
            inherit (config.lib.formats.rasi) mkLiteral;
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
        in {
            "*" = {
                bg = mkLiteral "${background}";
                bg-alt = mkLiteral "${black}";
                fg = mkLiteral "#FFFFFF";
                fg-alt = mkLiteral "${foreground}";

                border = mkLiteral "0px";
                margin = mkLiteral "0px";
                spacing = mkLiteral "0px";
                padding = mkLiteral "0px";

                background-color = mkLiteral "@bg";
                separatorcolor = mkLiteral "@fg";
                text-color = mkLiteral "@fg";
            };

            "#window" = {
                width = mkLiteral "45%";
                height = mkLiteral "39.5%";
            };

            "#mainbox" = {
                children = map mkLiteral [
                "inputbar"
                "listview"
                ];
            };

            "#inputbar" = {
                children = map mkLiteral [
                "prompt"
                "entry"
                ];
                background-color = mkLiteral "@bg-alt";
            };

            "#entry" = {
                padding = mkLiteral "12px";
            };

            "#prompt" = {
                padding = mkLiteral "12px";
            };

            "#listview" = {
                lines = mkLiteral "8";
                background-color = mkLiteral "@bg";
            };

            "#element" = {
                children = map mkLiteral [
                "element-text"
                ];
            };

            "#element-text" = {
                padding = mkLiteral "12px";
                text-color = mkLiteral "@fg-alt";
            };

            "#element-text selected" = {
                text-color = mkLiteral "@fg";
            };
        };
    };

    home.file.".config/rofi/leave.sh".source = ./leave.sh;
}
