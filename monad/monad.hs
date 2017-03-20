data ST a = ST( (String,String) -> ((String,String),a))
instance Monad ST where
    return :: a-> ST a
    return val = ST ()