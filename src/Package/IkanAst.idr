module Package.IkanAst
import Package.IpkgAst
%access public export

data IkanData : Type -> Type where
  AddDependencies : List String -> IkanData Unit
  AddSourcepaths : List String -> IkanData Unit
