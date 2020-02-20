# Haskell Workshop 2020 - Part 3, CRUD REST API

## Goals

* Build a simple JSON CRUD REST API
* Learn about some haskell libs:
  * Postgresql-simple
* Use HIE the Haskell IDE Engine (an LSP server using GHC)

## HIE

* You'll need the Haskell Language Server VSCode extension
* VSCode needs to be started from within the nix shell (we'll provide the right HIE version with Nix):
  * `./shell.sh` -- this scripts add another binary cache for HIE so that you don't end-up building haskell libraries forever!
  * `code -n .`

For mac users: if you see warnings like "you're not a trusted user", this means you have nix running as a daemon,
and you need to add yourself as a trusted user. Find you nix.conf (should be in /etc) and append this line:
`trusted-users = <your username>`.

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

