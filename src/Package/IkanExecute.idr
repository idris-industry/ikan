module Package.IkanExecute
import Package.IkanAst
import Package.IpkgAst
import Control.Monad.Freer
import Debug.Trace
import Control.Monad.Id
import Data.Fin
import Control.Monad.State

%access public export


ikanExec' : {x : Type} -> IkanData x -> IO x
ikanExec' (AddDependencies xs) = pure ()
ikanExec' (AddSourcepaths xs) = pure ()

ikanExec : {x : Type} -> Freer IkanData x -> IO x
ikanExec x = foldFreer ikanExec' x

{-
ex1:IkanDataT
ex1 = do
  AddDependencies []
  AddSourcepaths []

-}
