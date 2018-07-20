module Main 
import Package.IpkgAst
import Package.IkanHelper 
import System

defaultDir : String
defaultDir = "~/.idris-ikan"

echo : String -> IO ()
echo = putStrLn

rawcmd : String -> IO ()
rawcmd c = do system c ; pure ()

ikanInit : IO ()
ikanInit = do
  r<-createDir defaultDir
  case r of 
         (Left l)=>  echo "error ikanInit"
         (Right x)=>  pure ()



cmds : List (String,String,IO ())
cmds = [("new","create new project with template",do
  echo "project name ?"
  fn<-getLine
  r<-createDir fn
  case r of 
         (Left l)=>  echo "error !"
         (Right x)=>  do 
           writeFile (fn++"/"++ fn++".ipkg") (ipkgPackage fn) 
           writeFile (fn++"/.gitignore") (IkanHelper.gitign)
           echo $ "ok,project created : "++ fn
           echo "create main.idr? n for not "
           x<-getLine
           if (x=="n") then pure () else do writeFile (fn++"/Main.idr") "module Main\n";pure ()
           ) ,
         ("lst","init ikan pm",do
           r<-dirOpen defaultDir
           case r of 
                (Left l)=> ikanInit
                (Right r)=> echo "dir ok!"
         ),
         ("clean","clean this project,delete all .ibc file",rawcmd "idris clean ipkg")
         ]

showHelp : IO ()
showHelp = let acts=map (\(a,_)=>a) cmds in do
  echo $ "showing help : "
  putStrLn $ "avail commands : " ++ foldl1 (\x,y=>x++"\n"++y) acts

main : IO ()
main = do
  echo "welcome to ikan,a idris package manager ! "
  args<-getArgs
  d<-dirOpen "src/"
  case d of 
    Left l =>do print l; echo "failed dir 1"
    (Right r)=> do
      dd<-dirEntry r
      case dd of
        (Left l)=> do print l; echo "failed dir 2"
        (Right r)=> do
          echo "dd failed di2r"
          echo r
          pure ()
      pure ()
  case args of
       []=> showHelp
       (_ :: Nil)=> showHelp
       (_ :: x :: xs)=> 
         let act=find (\cmd=> let (nm,_)=cmd in nm==x) cmds 
           in 
              case act of
                Nothing=> do 
                  echo "cmd not found"
                  showHelp
                Just (_, _,b)=> b
  pure ()
