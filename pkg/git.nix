{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        delta.enable = true;
        lfs.enable = true;

        userName  = "cadkin";
        userEmail = "<redacted>";

        delta.options = {
            decorations = {
                commit-decoration-style = "bold yellow box ul";
                file-decoration-style = "none";
                file-style = "bold yellow ul";
            };
            features = "decorations";
            whitespace-error-style = "22 reverse";
            navigate = true;
        };

        extraConfig = {
            safe.directory = "*";
        };
    };
}
