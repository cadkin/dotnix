{
    description = "Flake-based configuration for home directory";

    inputs = {
        nixpkgs.url             = github:NixOS/nixpkgs/nixos-22.11;
        nixpkgs-unstable.url    = github:NixOS/nixpkgs/nixpkgs-unstable;
        nixpkgs-devel.url       = github:cadkin/nixpkgs/devel;

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
                username = hm-config.username;
            };

            pkgs = extraSpecialArgs.pkgs;

            modules = [
                ./home/home.nix
                ./home/xdg.nix
                ./home/xresources.nix
                ./home/env.nix

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

