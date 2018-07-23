module Assets 

-- strings,file templates for new project

gitignore : String
gitignore = """"""

mainFile  : String
mainFile = """"""

pkgFile  : String->String
pkgFile nm = """
package $nm

modules = Main

main = Main

"""
