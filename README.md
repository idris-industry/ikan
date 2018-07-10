# ipkg : package manager for idris,in idris

This project aims provides a user api in idris at minimum and should reuse other efforts as much as possible(the code should be in idris)

discuss about ipkg format is here,but we love a lean approach,so idris for everything,not yaml,xml or some other file format

https://github.com/idris-lang/Idris-dev/issues/1825

https://github.com/idris-lang/Idris-dev/wiki/Egg-%237:-The-Idris-Package-Manager

# Dependency 
install idris-free package with freer

https://github.com/clayrat/idris-free (not merged yet)

# Ideas to draw from

scala 's `mill` and  `sbt` 

clojure

# General ideas

an idris file but a specical file extension , .ipkg. It must contain a special entry `main : PkgIO ()` 

# Contribution welcomed!
