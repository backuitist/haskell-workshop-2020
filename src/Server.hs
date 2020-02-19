module Server where

import Web.Scotty
import ClassyPrelude
import qualified PG
import qualified User
import PG (DbConfig(..))

runMigrationsAndBindServer :: IO ()
runMigrationsAndBindServer = do
    let dbConfig = DbConfig {
        port = 5432
      , user = "user"
      , password = "pwd"
      , host = "localhost"
      , dbName = Nothing
      , migrationsDir = Just "db-migrations"
    }
    PG.runMigrations dbConfig
    bindServer dbConfig

bindServer :: DbConfig -> IO ()
bindServer dbConf = scotty 3000 $
  get "/users" $ do
    users <- liftIO $ PG.withConnection dbConf User.findUsers
    json users

  -- TODO
  -- post "/users"    

