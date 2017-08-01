{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_prime_factors (
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
version = Version [1,0,0,3] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/nambrot/exercism/haskell/prime-factors/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/bin"
libdir     = "/Users/nambrot/exercism/haskell/prime-factors/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/lib/x86_64-osx-ghc-8.0.2/prime-factors-1.0.0.3-Ep1h3rSsw34JLe6tteDmEj"
dynlibdir  = "/Users/nambrot/exercism/haskell/prime-factors/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/lib/x86_64-osx-ghc-8.0.2"
datadir    = "/Users/nambrot/exercism/haskell/prime-factors/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/share/x86_64-osx-ghc-8.0.2/prime-factors-1.0.0.3"
libexecdir = "/Users/nambrot/exercism/haskell/prime-factors/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/libexec"
sysconfdir = "/Users/nambrot/exercism/haskell/prime-factors/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "prime_factors_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "prime_factors_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "prime_factors_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "prime_factors_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "prime_factors_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "prime_factors_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)