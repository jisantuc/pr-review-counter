module PullRequest where

import           Data.Time.Clock          (UTCTime)
import           Data.Vector
import           GitHub.Data.Definitions
import           GitHub.Data.PullRequests

data PullRequestReview =
  PullRequestReview { additions :: Int
                    , deletions :: Int
                    , commits   :: Int
                    , user      :: Vector SimpleUser
                    , openedAt  :: UTCTime
                    , closedAt  :: Maybe UTCTime }

fromPullRequest :: PullRequest -> PullRequestReview
fromPullRequest pr = PullRequestReview
  ( pullRequestAdditions pr )
  ( pullRequestDeletions pr )
  ( pullRequestCommits pr )
  ( pullRequestRequestedReviewers pr )
  ( pullRequestCreatedAt pr )
  ( pullRequestClosedAt pr )

