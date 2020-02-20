{ ghcVersion ? "ghc865",
  forShell ? false,
  withPgCli ? false }:
let   
  pkgs = import ./nixpkgs.nix;
  hPkgs = pkgs.haskell.packages."${ghcVersion}";
  hie = import ./hie.nix { inherit ghcVersion; };
  restApi = hPkgs.callCabal2nix "project" ./. {};
  pg-local = pkgs.writeShellScriptBin "pg-local" ''
    ${pkgs.pgcli}/bin/pgcli -u user -p pwd -h localhost -p 5432
  '';
in
  if forShell then hPkgs.shellFor {
    packages = _: [restApi];
    buildInputs = [
        hPkgs.cabal-install
        pkgs.wrk
        hie        
    ] ++ (if withPgCli then [pg-local pkgs.pgcli] else []);
  } else restApi
