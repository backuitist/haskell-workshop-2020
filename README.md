# Haskell Workshop 2020 - Part 3, CRUD REST API

## Goals

* Build a simple JSON CRUD REST API
* Learn about some haskell libs:
  * Postgresql-simple
* Use HIE the Haskell IDE Engine (an LSP server using GHC)

## HIE

* You'll need the Haskell Language Server VSCode extension
* VSCode needs to be started from within the nix shell (we'll provide the right HIE version with Nix):
  * `nix-shell`
  * `code -n .`

## Let's try it

We'll need a DB, so for convenience I've added a docker compose file to spin up a local PG:
* `docker-compose -f db-compose.yml up --force-recreate`

For convenience I've added a small script that connects to the above created DB:
* `nix-shell --arg withPgCli true` (the script uses pgcli, but is optional to avoid pulling too much stuff)
* `pg-local`
* let's what we have there: `\dt`

Then back to the REPL:
* `nix-shell`
* `cabal repl`
* `runMigrationsAndBindServer` will run migrations and bind the http server on port 3000
* `curl -v localhost:3000/users` should be `[]`

