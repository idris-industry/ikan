module Package.IpkgAst

%access public export
ipkgPackage : String->String
ipkgPackage x = "package " ++x
