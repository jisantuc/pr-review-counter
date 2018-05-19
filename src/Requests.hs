module Requests where

import           Data.Monoid
import           Data.Vector
import           GitHub.Data.Definitions
import           GitHub.Data.Options
import           GitHub.Endpoints.PullRequests

opts :: PullRequestMod
opts = sortByUpdated <> sortDescending <> stateClosed

-- TODO: refactor to use reader
-- `Name x` is really just a string but GitHub client is particular about things
listRequest :: Name Owner -> Name Repo -> Request k (Vector SimplePullRequest)
listRequest owner repo =
  pullRequestsForR owner repo opts 100

-- TODO: refactor to use reader
singleRequest :: Name Owner -> Name Repo -> Id PullRequest -> Request k PullRequest
singleRequest owner repo id =
  pullRequestR owner repo id
