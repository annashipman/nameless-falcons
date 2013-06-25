module Paths_nameless_falcons_topk (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/Users/annashipman/Library/Haskell/ghc-7.6.3/lib/nameless-falcons-topk-0.1/bin"
libdir     = "/Users/annashipman/Library/Haskell/ghc-7.6.3/lib/nameless-falcons-topk-0.1/lib"
datadir    = "/Users/annashipman/Library/Haskell/ghc-7.6.3/lib/nameless-falcons-topk-0.1/share"
libexecdir = "/Users/annashipman/Library/Haskell/ghc-7.6.3/lib/nameless-falcons-topk-0.1/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "nameless_falcons_topk_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "nameless_falcons_topk_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "nameless_falcons_topk_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "nameless_falcons_topk_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
