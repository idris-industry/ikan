module Main 
import Package.IpkgAst
import Package.IkanAssets
import System

ikanSettingsDir : String
ikanSettingsDir = "~/.idris-ikan"

echo : String -> IO ()
echo = putStrLn

echo0 : String -> IO ()
echo0 = putStr

rawcmd : String -> IO ()
rawcmd c = do system c ; pure ()

ikanInit : IO ()
ikanInit = do
  r<-createDir ikanSettingsDir
  case r of 
         (Left l)=>  echo "error ikanInit"
         (Right x)=>  pure ()



cmds : List (String,String,IO ())
cmds = [("np","create new template project ",do
  echo "project name ?"
  fn<-getLine
  r<-createDir fn
  case r of 
         (Left l)=>  echo "error !"
         (Right x)=>  do 
           writeFile (fn++"/"++ fn++".ipkg") (ipkgPackage fn) 
           writeFile (fn++"/.gitignore") (IkanAssets.flGitignore)
           echo $ "ok,project created : "++ fn
           echo "create main.idr? n for not "
           x<-getLine
           if (x=="n") then pure () else do writeFile (fn++"/Main.idr") IkanAssets.flMain;pure ()
           ) ,
         ("iinit","initialize ikan package manager(write files to "++ikanSettingsDir++")",do
           r<-dirOpen ikanSettingsDir
           case r of 
                (Left l)=> ikanInit
                (Right r)=> echo "dir ok!"
         ),
         ("clr","clean this project,delete all .ibc file",do
         rawcmd "rm **/*.ibc"
         echo "ok,project cleaned"
         --rawcmd "idris clean ipkg"
         ),
         ("nf","new file/module",
         do
           echo0 "new file/module name:"
           s<-getLine
           writeFile (s++".idr") $ concat ["module ",s," \n"]
           pure ()
           )
         ]

showHelp : IO ()
showHelp = do
  let lns=map (\(c,desc,_) => concat [" ",c," : ",desc," \n"]) cmds
  echo $ "showing help : "
  putStrLn $ "avail commands : \n" ++ (foldl1 (\x,y=>x++y) lns)

listDirs : String->IO ()
listDirs s = do
  d<-dirOpen s
  case d of 
    Left l => echo "failed dirOpen "
    (Right d1)=> do
      echo $ "dirOpen "++s ++" ok !"
      nextdir<-dirEntry d1
      case nextdir of
        (Left l)=> do print l; echo "dirEntry failed"
        (Right r)=> do
          echo $ "dir dirEntry " ++ s ++ " ok!"
          listDirs r

main : IO ()
main = do
--  let 
  echo "welcome to ikan , a idris package manager in idris ! "
--  listDirs "src"
  args<-getArgs
  case args of
       (_ :: x :: xs) => doAct x
       y => do 
         showHelp
         echo0 "input cmd:"          
         ln<-getLine
         doAct ln
  
  pure ()
where
    doAct : String->IO ()
    doAct = (\x => let act = find (\cmd=> let (nm,_,_)=cmd in nm==x) cmds 
                    in (case act of
                            Nothing=> do echo "cmd not found"
                                         showHelp
                            Just (_, _,io)=> io))


