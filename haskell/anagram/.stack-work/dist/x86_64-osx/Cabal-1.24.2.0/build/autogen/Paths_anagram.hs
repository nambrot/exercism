{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_anagram (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0,1,4] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/nambrot/exercism/haskell/anagram/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/bin"
libdir     = "/Users/nambrot/exercism/haskell/anagram/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/lib/x86_64-osx-ghc-8.0.2/anagram-1.0.1.4-6VK1aLRYs4A9bNP4chQ3EH"
dynlibdir  = "/Users/nambrot/exercism/haskell/anagram/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/lib/x86_64-osx-ghc-8.0.2"
datadir    = "/Users/nambrot/exercism/haskell/anagram/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/share/x86_64-osx-ghc-8.0.2/anagram-1.0.1.4"
libexecdir = "/Users/nambrot/exercism/haskell/anagram/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/libexec"
sysconfdir = "/Users/nambrot/exercism/haskell/anagram/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "anagram_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "anagram_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "anagram_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "anagram_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "anagram_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "anagram_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
