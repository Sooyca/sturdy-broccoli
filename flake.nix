{
  description = "A template for Nix based C++ project setup.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/23.05";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... }@inputs: inputs.utils.lib.eachSystem [
    "x86_64-linux" "aarch64-linux"
  ] (system: let
    pkgs = import nixpkgs {
      inherit system;
      # config.allowUnfree = true;
    };
  in {
    packages.default = pkgs.stdenv.mkDerivation rec {
      pname = "brocoli";
      version = "0.1.0";
      
      src = ./.;

      nativeBuildInputs = [ pkgs.cmake ];
      buildInputs = [ pkgs.SDL2 ];

      cmakeFlags = [
        "-DENABLE_TESTING=OFF"
        "-DENABLE_INSTALL=ON"
      ];
    };
  });
}