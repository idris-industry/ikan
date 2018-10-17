import Package.IkanAst
import Package.IpkgAst
import Control.Monad.Freer
import Debug.Trace
import Control.Monad.Id
import Data.Fin
import Control.Monad.State

build:IkanDataT
build = do
  AddDependencies [""]
  AddSourcepaths [""]
