{ config, pkgs, ... }:

{
    xresources.properties = {
        "XTerm.vt100.reverseVideo" = true;
        "xterm*utf8Title"          = true;

        "Sxiv.background" = "#222222";
        "Sxiv.foreground" = "#bbbbbb";
    };
}
