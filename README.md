# dotnix

1. Install [Nix](https://github.com/DeterminateSystems/nix-installer) or use NixOS.

2. Clone this repo to `$HOME/.dotnix`.

3. Change `home.username` in `home/home.nix` and `homeConfigurations.<user>` in `flake.nix` to your username. Also change `home.homeDirectory` if that's different for some reason.

4. Bootstrap with:
   ```
   $ nix run . switch -- --flake .
   ```

5. Future invocations can use:
   ```
   $ home-manager switch --flake .
   ```

