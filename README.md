[![Join the chat at https://gitter.im/idris-gitter/Lobby](https://badges.gitter.im/idris-gitter/Lobby.svg)](https://gitter.im/idris-gitter/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# ikan : package manager for idris,in idris

This project aims provides a user api in idris at minimum and should reuse other efforts as much as possible


General discuss about idris package manager is here

https://github.com/idris-lang/Idris-dev/issues/1825

https://github.com/idris-lang/Idris-dev/wiki/Egg-%237:-The-Idris-Package-Manager

# Why named ikan

kan extensions subsume all concepts in 1-dimensional category theory(by Mac Lane),and this project will use freer monads ,which is closely connected to kan extensions

# Planned functionality

build,install to local 

version resolution

list all pkgs

generate template project

zsh integration

a website 

# The big picture 

The entry `main : PkgIO ()` is just the IO () for our package manager (We may just use plain old IO () instead).However,any operations would be constructed via freer monad DSLs,which separate specification and execution to a even higher level.

Some examples of freer monadic DSL can be found at https://github.com/doofin/tensorflow-idris/blob/baea775a608c2e8e29cb0d30555499edb18c8a9e/UserApi.idr


repo hosting : just use github 

.ipkg compatibility

# Dependency 

install idris-free package with freer

https://github.com/idris-industry/idris-free (not merged yet)

# Ideas to draw from

scala 's `mill` and  `sbt` : https://github.com/lihaoyi/mill

clojure : https://leiningen.org/

# Contribution welcomed!
