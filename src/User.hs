module User where

import ClassyPrelude
import Data.Aeson (ToJSON, FromJSON)
import Database.PostgreSQL.Simple (Connection, execute, query, FromRow)
import Database.PostgreSQL.Simple.SqlQQ

data User = User {
   name :: Text
 , age :: Int  
} deriving (Generic)

instance FromRow User

instance ToJSON User
instance FromJSON User

insertUser :: Connection -> User -> IO ()
insertUser conn (User name' age') = do
    void $ execute conn qry (name', age')
    where 
        qry = [sql| insert into users (name, age) values (?, ?)|]

findUsers :: Connection -> IO [User]        
findUsers conn = query conn [sql|select name, age from users|] ()