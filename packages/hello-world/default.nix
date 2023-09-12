{
  dream2nix,
  config,
  lib,
  self,
  ...
}: {
  imports = [
    dream2nix.modules.dream2nix.rust-cargo-lock
    dream2nix.modules.dream2nix.rust-crane
  ];

  name = "hello-world";
  version = "0.1.0";

  deps = {nixpkgs, ...}: {
    inherit
      (nixpkgs)
      stdenv
      ;
  };

  mkDerivation = {
    src = ./.;
  };

  rust-crane = {
    buildProfile = "dev";
    buildFlags = ["--verbose"];
    runTests = false;
  };
}
