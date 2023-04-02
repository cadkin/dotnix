{ config, pkgs, ... }:

{
    programs.urxvt = {
        enable = true;

        scroll = {
            bar = {
                enable = true;
                floating = true;
            };

            lines = 100000;
        };

        transparent = true;
        shading = 10;
    };
}
