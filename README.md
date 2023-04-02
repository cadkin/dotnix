# dotnix

1. Install [Nix](https://github.com/DeterminateSystems/nix-installer) or use NixOS.

2. Clone this repo to `$HOME/.dotnix`.

3. Change `username` in `user.nix` to your username. Also change `home.homeDirectory` in `home/home.nix` if that's different for some reason.

4. Bootstrap with:
   ```
   $ nix run . switch -- --flake .
   ```

5. Future invocations can use:
   ```
   $ home-manager switch --flake .
   ```

