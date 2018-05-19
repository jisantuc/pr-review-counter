module Main where

import           Data.Vector      ((!))
import           GitHub.Data.Name (mkName)
import           GitHub.Request   (executeRequest)

import           Auth
import           Requests

main :: IO ()
main = do
  auth <- getAuth
  simplePrs <- executeRequest auth $ listRequest "raster-foundry" "raster-foundry"
  print auth
  print $ (! 1) <$> simplePrs
