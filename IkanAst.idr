module Package.IkanAst
-- import Package.IpkgAst


data IkanData : Type -> Type where
  AddDependencies : List String -> IkanData Unit
  AddSourcepaths : List String -> IkanData Unit
