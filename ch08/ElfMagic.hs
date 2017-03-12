-- file: ch08/ElfMagic.hs

import qualified Data.ByteString.Lazy as L
hasElfMagic :: L.ByteString -> Bool
hasElfMagic content = L.take 4 content == elfMagic
  where elfMagic = L.pack [0x7f, 0x45, 0x4c, 0x46]


-- 不要用isElfFile 函数来测试windows系统下的可执行文件，因为它们具有MZ头
-- 可以测试Liunx下的可执行文件，比如/bin/bash
isElfFile :: FilePath -> IO Bool
isElfFile path = do
  content <- L.readFile path
  return (hasElfMagic content)
