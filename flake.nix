{
    description = "Flake-based configuration for home directory";

    inputs = {
        nixpkgs.url             = github:NixOS/nixpkgs/nixos-22.11;
        nixpkgs-unstable.url    = github:NixOS/nixpkgs/nixpkgs-unstable;
        nixpkgs-devel.url       = github:cadkin/nixpkgs/devel;

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = attrs @ { self, nixpkgs, home-manager, ... }: rec {
        system = "x86_64-linux";

        defaultPackage.${system} = home-manager.defaultPackage.${system};

        homeConfigurations.cva = home-manager.lib.homeManagerConfiguration rec {
            extraSpecialArgs = {
                inputs = self.inputs;
                pkgs = import attrs.nixpkgs {
                    inherit system;
                };
            };

            pkgs = extraSpecialArgs.pkgs;

            modules = [
                ./home/home.nix
                ./home/xdg.nix

                ./pkg/dot.nix

                ./pkg/git.nix
                ./pkg/vim.nix
            ];

        };
    };

}

