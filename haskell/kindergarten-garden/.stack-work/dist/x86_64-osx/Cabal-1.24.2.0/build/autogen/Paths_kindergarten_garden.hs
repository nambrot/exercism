{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_kindergarten_garden (
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

bindir     = "/Users/nambrot/exercism/haskell/kindergarten-garden/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/bin"
libdir     = "/Users/nambrot/exercism/haskell/kindergarten-garden/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/lib/x86_64-osx-ghc-8.0.2/kindergarten-garden-1.0.0.3-FeKcKDgtP5mAil4uyTofG9"
dynlibdir  = "/Users/nambrot/exercism/haskell/kindergarten-garden/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/lib/x86_64-osx-ghc-8.0.2"
datadir    = "/Users/nambrot/exercism/haskell/kindergarten-garden/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/share/x86_64-osx-ghc-8.0.2/kindergarten-garden-1.0.0.3"
libexecdir = "/Users/nambrot/exercism/haskell/kindergarten-garden/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/libexec"
sysconfdir = "/Users/nambrot/exercism/haskell/kindergarten-garden/.stack-work/install/x86_64-osx/lts-8.21/8.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "kindergarten_garden_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "kindergarten_garden_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "kindergarten_garden_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "kindergarten_garden_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "kindergarten_garden_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "kindergarten_garden_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
