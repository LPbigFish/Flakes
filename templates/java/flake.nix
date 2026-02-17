{
  description = "Description for the project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem =
        {
          config,
          self',
          inputs',
          pkgs,
          system,
          ...
        }:
        let
          java = pkgs.openjdk25.override {
            enableJavaFX = true;
          };
          maven = pkgs.maven;
          sb = pkgs.scenebuilder;
          #gradle = pkgs.gradle;
        in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = [
              java
              maven
              sb
            ];
          };
        };
    };
}
