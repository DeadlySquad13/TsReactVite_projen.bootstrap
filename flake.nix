{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    { systems, nixpkgs, ... }@inputs:
    let
      eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = eachSystem (pkgs: {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # nodejs

            # You can set the major version of Node.js to a specific one instead
            # of the default version
            nodejs_22

            # It is possible to use bun instead of node.
            # bun

            # Optionally, you can add yarn or pnpm for package management for node.
            # nodePackages.pnpm
            # yarn

            nodePackages.typescript
            # nodePackages.typescript-language-server
            prettierd
          ];
        };
      });
    };
}
