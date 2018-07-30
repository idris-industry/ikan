[![Join the chat at https://gitter.im/idris-gitter/Lobby](https://badges.gitter.im/idris-gitter/Lobby.svg)](https://gitter.im/idris-gitter/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# ikan : package manager for idris,in idris

packages will be hosted here:https://github.com/orgs/idris-packages/ , if you want to help please email me

This project aims provides a user api in idris at minimum and should reuse other efforts as much as possible

General discuss about idris package manager is here

https://github.com/idris-lang/Idris-dev/issues/1825

https://github.com/idris-lang/Idris-dev/wiki/Egg-%237:-The-Idris-Package-Manager
# Currently Implemented

create new project with .ipkg template

# Usage 

clone and cd into this repo

```
	idris --build ikan.ipkg
	
	or
	
	sh install.sh
	
```

and then move or symlink generated bin `ikan` to your path

# Sources

Assets.idr : templates for new project ,etc

Main.idr : main entry

# Why named ikan

kan extensions subsume all concepts in 1-dimensional category theory(by Mac Lane),and this project will use freer monads ,which is closely connected to kan extensions. However,using ikan assume no knowledge of any category theory,you just have to be familiar with do notation and functional programming.

# Planned functionality

any thing is put at a central place , `~/.idris-ikan` ,which keeps your project directory clean

sandboxed environment for every project

multiple backends , js,jvm,etc,and library management

multiple version resolution methods, via git commit specification or automatic

build,install to local ,clean,list all pkgs

generate template project

zsh integration

a website (currently everything will be put at https://github.com/idris-packages , contact me if you want to manage packages!)

# The big picture 

The entry `main : PkgIO ()` is just the IO () for our package manager (We may just use plain old IO () instead).However we do not do actions in IO directly,any operations would be implemented DSLs (deep embedding),which makes it convenient to do multiple kinds of interpretation,and allows a comprehensive way of viewing what happens at building.

The reason for this kind of separation is that we can perform any analysis or inspection before actually perform it.Although the theories behind free monads are frightening,its usage is quite simple,and as users you will only see a simple monadic interface .

DSLs:https://www.cs.ox.ac.uk/people/jeremy.gibbons/publications/embedding-short.pdf

http://www.cs.ox.ac.uk/jeremy.gibbons/publications/embedding.pdf

Some examples of freer monadic DSL can be found at https://github.com/doofin/tensorflow-idris/blob/baea775a608c2e8e29cb0d30555499edb18c8a9e/UserApi.idr


repo hosting : just use git repos forked by idris-industry

convert from/to .ipkg

# Dependency 

install idris-free package with freer

https://github.com/idris-industry/idris-free (not merged yet)

# Ideas to draw from

scala 's `mill` and  `sbt` : https://github.com/lihaoyi/mill

clojure : https://leiningen.org/

# Existing idris pm

https://github.com/dcao/elba

https://github.com/idream-build/idream

# Contribution welcomed!
