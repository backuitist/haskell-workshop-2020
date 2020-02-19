# Haskell Workshop 2020 - Part 1, Nix

## Goals

* Build a simple Hello world using Nix
* What is Nix?

## Requirements

* Nix

See https://nixos.org/nix/download.html
```
curl https://nixos.org/nix/install | sh
```

## Let's start - GHCI

* `nix-shell`
* `ghci`

You should be in a haskell REPL
* print hello: `putStrLn "Hej hej!"`
* simple arithmetic: `1 + 2`

Leave the REPL

## Take it further, create a proper program

* In a separate window run VSCode and open `src/Main.hs`
* Then from the nix shell, run `cabal repl`
* In the GHC REPL, run the main function `main`
* Modify `src/Main.hs` and save
* From the REPL enter `:r`


## and produce a binary

* `nix-build`
* and run the result of the build: `result/bin/hej-hej`

## What's next

`git checkout 02-rest-api`

Or visit https://github.com/backuitist/haskell-workshop-2020/tree/02-rest-api
