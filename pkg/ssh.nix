{ config, pkgs, ... }:

{
    programs.ssh = {
        enable = true;

        matchBlocks = {
            "github.com" = {
                hostname = "ssh.github.com";
                port     = 443;
                user     = "git";
            };

            "silicon" = {
                hostname = "silicon.cbn9.lan";
                user     = "root";
            };
        };
    };
}
