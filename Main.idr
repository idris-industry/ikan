module Main 

defaultDir : String
defaultDir = "~/.idris-ikan"

echo : String -> IO ()
echo = putStrLn

ikanInit : IO ()
ikanInit = do
  r<-createDir defaultDir
  case r of 
         (Left l)=>  echo "error ikanInit"
         (Right x)=>  pure ()



cmds : List (String,IO ())
cmds = [("new",do
  echo "project name ?"
  fn<-getLine
  r<-createDir fn
  case r of 
         (Left l)=>  echo "error !"
         (Right x)=>  do 
           writeFile (fn++"/"++ fn++".ipkg") ("")
           echo $ "ok,project created : "++ fn),
         ("lst",do
           r<-dirOpen defaultDir
           case r of 
                (Left l)=> ikanInit
                (Right r)=> echo "dir ok!"
         )
         ]




showHelp : IO ()
showHelp = let acts=map (\(a,_)=>a) cmds in do
  echo $ "showing help : "
  putStrLn $ "avail commands : " ++ foldl1 (\x,y=>x++"\n"++y) acts

main : IO ()
main = do
  echo "welcome to ikan,a idris package manager"
  args<-getArgs
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
                (Just (a, b))=> b
  pure ()
