import Web.Scotty
import ClassyPrelude
import Data.Aeson (ToJSON)

main :: IO ()
main = scotty 3000 $
  get "/:name" $ do
    name <- param "name"
    json $ Hello name

data Hello = Hello {
   name :: Text
} deriving (Generic)

instance ToJSON Hello