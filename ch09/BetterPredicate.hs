-- file: ch09/BetterPredicate.hs
{-# LANGUAGE ScopedTypeVariables #-}
import           Control.Exception (bracket, handle,SomeException)
import           Control.Monad     (filterM)
import           System.Directory  (Permissions (..), getModificationTime,
                                    getPermissions)
import           System.FilePath   (takeExtension)
import           System.IO         (IOMode (..), hClose, hFileSize, openFile)
import           System.Time       (ClockTime (..))

-- the function we wrote earlier
import           RecursiveContents (getRecursiveContents)

type Predicate =  FilePath
               -> Permissions
               -> Maybe Integer
              -> ClockTime
              -> Bool

getFileSize :: FilePath -> IO (Maybe Integer)
getFileSize path = handle (\_ -> return Nothing) $
  bracket (openFile path ReadMode) hClose $ \h->do
    size <- hFileSize h
    return (Just size)

betterFind :: Predicate -> FilePath -> IO [FilePath]
betterFind p path = getRecursiveContents path >>= filterM check
    where
      check name = do
        perms <- getPermissions name
        size <- getFileSize name
        modified <- getModificationTime name
        return (p name perms size modified)


simpleFileSize :: FilePath -> IO Integer
simpleFileSize path = do
  h <- openFile path ReadMode
  size <- hFileSize h
  hClose h
  return size

saferFilesize :: FilePath -> IO (Maybe Integer)
saferFilesize path = handle (\(_::SomeException) -> return Nothing) $ do
  h <- openFile path ReadMode
  size <- hFileSize h
  hClose h
  return (Just size)
