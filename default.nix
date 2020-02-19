{ pkgs ? import <nixpkgs> {},
  ghcVersion ? "ghc865",
  forShell ? false }:
let   
  hPkgs = pkgs.haskell.packages."${ghcVersion}";
  restApi = hPkgs.callCabal2nix "project" ./. {};
in
  if forShell then hPkgs.shellFor {
    packages = _: [restApi];
    buildInputs = [
        hPkgs.cabal-install
        pkgs.wrk
    ];
  } else restApi
