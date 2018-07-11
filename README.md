# ipkg : package manager for idris,in idris

This project aims provides a user api in idris at minimum and should reuse other efforts as much as possible(the code should be in idris)

discuss about ipkg format is here,but we love a lean approach,so idris for everything,not yaml,xml or some other file format

https://github.com/idris-lang/Idris-dev/issues/1825

https://github.com/idris-lang/Idris-dev/wiki/Egg-%237:-The-Idris-Package-Manager

# The big picture 

The entry `main : PkgIO ()` is just the IO () for our package manager (We may just use plain old IO () instead).However,any operations would be constructed via freer monad DSLs,which separate specification and execution to a even higher level.

Some examples of freer monadic DSL can be found at https://github.com/doofin/tensorflow-idris/blob/baea775a608c2e8e29cb0d30555499edb18c8a9e/UserApi.idr


# Dependency 
install idris-free package with freer

https://github.com/clayrat/idris-free (not merged yet)

# Ideas to draw from

scala 's `mill` and  `sbt` 

clojure

# Contribution welcomed!
