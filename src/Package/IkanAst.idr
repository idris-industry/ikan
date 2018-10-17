module Package.IkanAst
import Package.IpkgAst
import Control.Monad.Freer
import Debug.Trace
import Control.Monad.Id
import Data.Fin
import Control.Monad.State

%access public export

data IkanData : Type -> Type where
  AddDependencies : List String -> IkanData Unit
  AddSourcepaths : List String -> IkanData Unit

IkanDataT : Type
IkanDataT = Freer IkanData Unit

implicit liftd : IkanData a -> Freer IkanData a
liftd  = liftF

{-
ex1:IkanDataT
ex1 = do
  AddDependencies []
  AddSourcepaths []

-}
