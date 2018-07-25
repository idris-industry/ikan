module Package.IkanAssets

%access public export

flGitignore : String
flGitignore = """
*.ibc
*.o

# -*- mode: gitignore; -*-
*~
\#*\#
/.emacs.desktop
/.emacs.desktop.lock
*.elc
auto-save-list
tramp
.\#*

ikan
"""

flMain  : String
flMain = """
module Main\n
"""

flPkg  : String->String
flPkg nm = """
package $nm

modules = Main

main = Main

sourcedir = src

executable = main

"""
