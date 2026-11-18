{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              ruby_3_3
              git
              pkg-config

              # native gem extensions (ffi, eventmachine…)
              libffi
              zlib
              openssl

              curl
            ];

            shellHook = ''
              export BUNDLE_PATH="$PWD/vendor/bundle"
              export LD_LIBRARY_PATH="${
                pkgs.lib.makeLibraryPath [ pkgs.curl ]
              }''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
            '';
          };
        };
    };
}
