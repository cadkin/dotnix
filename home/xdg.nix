{ config, pkgs, ... }:

{
    # Set all userdirs to home directory.
    xdg.userDirs = {
        enable = true;

        desktop     = config.home.homeDirectory;
        documents   = config.home.homeDirectory;
        download    = config.home.homeDirectory;
        music       = config.home.homeDirectory;
        pictures    = config.home.homeDirectory;
        publicShare = config.home.homeDirectory;
        templates   = config.home.homeDirectory;
        videos      = config.home.homeDirectory;
    };
}
