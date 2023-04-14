{ config, pkgs, pkgs-devel, ... }:

{
    home.packages = [
        pkgs-devel.qtcreator
        pkgs-devel.clazy
        pkgs-devel.clang-tools
    ];
}
