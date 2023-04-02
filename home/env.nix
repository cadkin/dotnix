{ config, pkgs, ... }:

{
    home.sessionVariables = {
        EDITOR = "${config.programs.vim.package}/bin/vim";
    };
}
