{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... } @inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      yharnam = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        modules = [
           ./nixos/configuration.nix
            {
        nixpkgs.config.allowUnfree = true;
        }

            ];
      };
    };

    devShells.${system} = {
      python = pkgs.mkShell {
        buildInputs = [
          pkgs.python3
          pkgs.gtk3
          pkgs.gobject-introspection
          (pkgs.python3.withPackages (ps: with ps; [
            pygobject3
            pip
            pillow
            requests
          ]))
        ];
        shellHook = ''
          echo "🐍 Python dev shell ready"
        '';
      };

      java = pkgs.mkShell {
        buildInputs = [
          pkgs.openjdk
          pkgs.maven
          pkgs.gradle
        ];
        shellHook = ''
          echo "☕ Java dev shell ready"
        '';
      };

      cppRust = pkgs.mkShell {
        buildInputs = [
          pkgs.gcc
          pkgs.clang
          pkgs.rustc
          pkgs.cargo
          pkgs.make
        ];
      shellHook = ''
        echo "🚀 C, C++, and Rust dev shell ready"
      '';
    };
  };

  };
}
