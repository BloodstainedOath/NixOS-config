{
  description = "A not so basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
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
              tkinter
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
            pkgs.cmake
          ];
          shellHook = ''
            echo "🚀 C, C++, and Rust dev shell ready"
          '';
        };

        js = pkgs.mkShell {
          buildInputs = [
            pkgs.nodejs_20
            pkgs.yarn
            pkgs.eslint
            pkgs.nodePackages.typescript
          ];
          shellHook = ''
            echo "🟨 JavaScript/Node.js dev shell ready"
            echo "Node version: $(node -v)"
            echo "NPM version: $(npm -v)"
          '';
        };
      };
    };
}
