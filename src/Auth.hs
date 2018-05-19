module Auth where

import           Data.ByteString.Char8 (pack)
import           Data.Maybe            (maybe)
import           GitHub.Auth           (Auth (OAuth), Token)
import           System.Environment    (lookupEnv)

tokenVar :: String
tokenVar = "GITHUB_ACCESS_TOKEN"

missingToken :: String
missingToken = "NO TOKEN PROVIDED. Check GITHUB_ACCESS_TOKEN env variable"

getAuth :: IO Auth
getAuth = (OAuth . pack . maybe missingToken id) <$> lookupEnv tokenVar
