module PG where

import ClassyPrelude
import Database.PostgreSQL.Simple
import Database.PostgreSQL.Simple.Migration (
  runMigration
  , MigrationContext(..)
  , MigrationCommand(..)
  )


data DbConfig = DbConfig {
    port :: Int
  , user :: Text
  , password :: Text
  , host :: Text
  , dbName :: Maybe Text
  , migrationsDir :: Maybe Text
} deriving (Generic)


runMigrations :: DbConfig -> IO ()
runMigrations config = withConnection config $ \conn -> migrateDb (migrationsDir config) conn

withConnection :: DbConfig -> (Connection -> IO a) -> IO a
withConnection config action = do
  conn <- connectPostgreSQL (encodeUtf8 $ pgConnectionString config)
  action conn

migrateDb :: Maybe Text -> Connection -> IO ()
migrateDb config = migrateDbFrom (unpack $ fromMaybe "postgresql/migrations" config)

migrateDbFrom :: FilePath -> Connection -> IO ()
migrateDbFrom migrationDir conn =
  void $ withTransaction conn (runMigration (ctx conn))
  where
    ctx = MigrationContext cmd migrationVerbose
    migrationVerbose = True
    cmd = MigrationCommands [ MigrationInitialization, MigrationDirectory migrationDir ]


pgConnectionString :: DbConfig -> Text
pgConnectionString dbConfig = "host='" <> (host dbConfig) 
                          <> case dbName dbConfig of
                                Just n -> "' dbname='" <> n
                                Nothing   -> ""
                          <> "' port='" <> (tshow $ port dbConfig) 
                          <> "' user='" <> (user dbConfig)
                          <> "' password='" <> (password dbConfig) <> "'"  
