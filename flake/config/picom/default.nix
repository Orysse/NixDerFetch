{ pkgs, ... }:
{
    services.picom = {
        package = pkgs.picom-pijulius;
        enable = true;
    };
}
