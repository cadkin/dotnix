{ config, pkgs, ... }:

{
    programs.vim = {
        enable = true;
        packageConfigurable = pkgs.vimHugeX;

        plugins = with pkgs.vimPlugins; [
            ctrlp
            lightline-vim
        ];

        extraConfig = (builtins.readFile files/vimrc);
    };
}
