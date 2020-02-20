# Haskell Workshop 2020 - Part 2, REST API

## Goals

* Build a simple JSON REST endpoint
* Learn about some haskell libs:
  * Aeson: JSON serialization [1],[2]
  * Scotty: simple (and almost dead!) web framework [3]
* Our first GHC extension

## Let's try it

* `nix-shell`
* `cabal repl`
* `main` will bind the http server on port 3000
* `curl -v localhost:3000/bob-the-sponge`
* finally a little benchmark `wrk -t4 -c50 -d5s http://localhost:3000`

## What's next

`git checkout 03-crud-rest-api`

Or visit https://github.com/backuitist/haskell-workshop-2020/tree/03-crud-rest-api


## References

* [1] Aeson - https://hackage.haskell.org/package/aeson
* [2] Aeson tutorial - https://artyom.me/aeson
* [3] Scotty - https://hackage.haskell.org/package/scotty
