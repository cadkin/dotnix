{ config, pkgs, location, ... }:

let
    dotOutOfStore = (config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotnix/pkg/dot");
in
{
    # Generic nix file to generate home directory files.

    # Files anywhere in home.
    #home.file = {
    #    <name>.source = "dot/foo";
    #}

    # Files in ~/.config.
    xdg.configFile = {
        "xfe/xferc".source = "${dotOutOfStore}/xferc";
    };
}
