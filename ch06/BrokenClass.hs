-- file: ch06/BrokenClass.hs

instance  (JSON a)=> JSON [(String, a)] where
  toJValue = undefined
  fromJValue = undefined
