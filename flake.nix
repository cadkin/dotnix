{
    description = "Flake-based configuration for home directory";

    inputs = {
        nixpkgs.url             = github:NixOS/nixpkgs/nixos-22.11;
        nixpkgs-master.url      = github:NixOS/nixpkgs/master;
        nixpkgs-devel.url       = github:cadkin/nixpkgs/qtcreator;

        home-manager = {
            url = github:nix-community/home-manager;
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = attrs @ { self, nixpkgs, home-manager, ... }: rec {
        system = "x86_64-linux";

        hm-config = import ./user.nix { };

        defaultPackage.${system} = home-manager.defaultPackage.${system};

        homeConfigurations.${hm-config.username} = home-manager.lib.homeManagerConfiguration rec {
            extraSpecialArgs = {
                inputs = self.inputs;
                pkgs = import attrs.nixpkgs {
                    inherit system;
                };
                pkgs-master = import attrs.nixpkgs-master {
                    inherit system;
                };
                pkgs-devel = import attrs.nixpkgs-devel {
                    inherit system;
                };

                username = hm-config.username;
            };

            pkgs = extraSpecialArgs.pkgs;

            modules = [
                ./home/home.nix
                ./home/xdg.nix
                ./home/xresources.nix
                ./home/env.nix
                ./home/pkg.nix

                ./scripts/scripts.nix

                ./dot/dot.nix

                ./pkg/git.nix
                ./pkg/vim.nix
                ./pkg/urxvt.nix
                ./pkg/ssh.nix
            ];
        };
    };
}

