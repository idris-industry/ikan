module Package.IpkgAst

import public Lightyear
import public Lightyear.Char
import public Lightyear.Strings

%default total
%access public export

ipkgPackage : String->String
ipkgPackage x = "package " ++x

{-      <|> clause "main" (iName []) (\st v -> st { idris_main = Just v })
      <|> clause "sourcedir" identifier (\st v -> st { sourcedir = v })
      <|> clause "opts" pOptions (\st v -> st { idris_opts = v ++ idris_opts st })
      <|> clause "pkgs" (commaSep (pPkgName <* someSpace)) (\st ps ->
      <|> clause "modules" (commaSep moduleName) (\st v -> st { modules = modules st ++ v })
      <|> clause "libs" (commaSep identifier) (\st v -> st { libdeps = libdeps st ++ v })
      <|> clause "objs" (commaSep identifier) (\st v -> st { objs = objs st ++ v })
      <|> clause "makefile" (iName []) (\st v -> st { makefile = Just (show v) })
      <|> clause "tests" (commaSep (iName [])) (\st v -> st { idris_tests = idris_tests st ++ v })
      <|> clause "version" textUntilEol (\st v -> st { pkgversion = Just v })
      <|> clause "readme" textUntilEol (\st v -> st { pkgreadme = Just v })
      <|> clause "license" textUntilEol (\st v -> st { pkglicense = Just v })
      <|> clause "homepage" textUntilEol (\st v -> st { pkghomepage = Just v })
      <|> clause "sourceloc" textUntilEol (\st v -> st { pkgsourceloc = Just v })
      <|> clause "bugtracker" textUntilEol (\st v -> st { pkgbugtracker = Just v })
      <|> clause "brief" stringLiteral (\st v -> st { pkgbrief = Just v })
      <|> clause "author" textUntilEol (\st v -> st { pkgauthor = Just v })
      <|> clause "maintainer" textUntilEol (\st v -> st { pkgmaintainer = Just v })-}
data Clause =  Imain String
           | Isourcedir String
           | Ipkgs (List String)
           | Iopts String
           | Ideps (List String)
--           | Ipkgs (List String)

IpkgAst : Type
IpkgAst = List Clause

Clause2cmdStr : Clause -> String
Clause2cmdStr x = "main"

partial
pNames : Parser String
pNames = (many $ noneOf "," )>>= pure . pack
partial
pClause : String -> Parser Clause
pClause x@"main" = do
  string x
  pure $ Imain x
pClause x@"pkgs" = do
  string x
  spaces
  string "="
  l<-pNames `sepBy` (string ",")
  pure $ Ipkgs l

pClause x = pure $ Imain ""
