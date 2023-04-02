{ config, pkgs, ... }:

let
    store = {
        cycle_sinks = (pkgs.writeText "cycle_sinks.py" (builtins.readFile files/cycle_sinks.py));
    };
in
{
    home.packages = [
        ( pkgs.writeShellApplication {
                name = "cycle_sinks";
                runtimeInputs = [ pkgs.python310 pkgs.pulseaudio pkgs.libnotify ];
                text = ''
                    ${pkgs.python310}/bin/python3 ${store.cycle_sinks} "$@"
                '';
                checkPhase = false;
        } )

        ( pkgs.writeShellApplication {
                name = "wacom_config";
                runtimeInputs = [ pkgs.xf86_input_wacom ];
                text = (builtins.readFile files/wacom.sh);
        } )
    ];
}
