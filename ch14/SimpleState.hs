-- file: ch14/SimpleState.hs

type SimpleState s a = s -> (a,s)
type StringState a = SimpleState String a

returnSt :: a->SimpleState s a
returnSt a = \s -> (a, s)

-- m == step
-- k == makeStep
-- s == oldState
bindSt :: (SimpleState s a) -> (a-> SimpleState s b) -> SimpleState s b
bindSt m k = \s -> let (a,s')= m s in (k a) s'

bindAlt step makeStep oldState =
  let (result, newState) = step oldState
  in (makeStep result) newState

getSt :: SimpleState s s
getSt = \s -> (s, s)
