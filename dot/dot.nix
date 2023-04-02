{ config, pkgs, location, ... }:

let
    dotOutOfStore = (config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotnix/dot/files/");
in
{
    # Generic nix file to generate home directory files.

    # Files anywhere in home.
    #home.file = {
    #    <name>.source = "dot/foo";
    #}

    # Files in ~/.config.
    xdg.configFile = {
        xfe.source = "${dotOutOfStore}/config/xfe/";
    };
}
