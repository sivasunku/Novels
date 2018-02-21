#' makeNovel - This makes each novel into a pdf, by executing the shell commands also.
#' There are important steps to perform, before and after to make it clean & tidy.
#' Pre-Requisites
#'     Ensure that there is a folder Novels in the data directory
#' Post
#'     The result file, open in chrome & save it as pdf. By programatically, it is not working.
#' @author Siva Sunku
#' @keywords make a single file
#' 
#' @param inUrl - url that needs to be downloaded.
#' @param novelName - Name of the novel
#' @param tempPath - Where temporary xml files are stored
#' @param codec - the temporary files like begin/end.txt. These can be applied as text, but considering huge size of objects, files are preferred
#' @param resPath - Where should be the result file sit? folder name.
#' @export
#' 
makeNovel <- function(inUrl,
                      novelName = "newNovel",
                      tempPath = "data/tempDir",
                      codec = "codec",
                      resPath = "data/result"){
  
  ## --- House cleaning ----------------------------------
  if ( !(dir.exists(tempPath)) ){
    dir.create(tempPath)
  }
  l <- list.files(path = tempPath,pattern = "*newFile*", full.names = TRUE)
  file.remove(l)
  
  if ( !(dir.exists(resPath)) ){
    dir.create(resPath)
  }
  
  beginFile <- paste(codec,"/begin.txt",sep = "")
  endFile   <- paste(codec,"/end.txt",sep = "")
  if ( all(file.exists(beginFile,endFile) == TRUE) == FALSE ){
    stop(" There is no beginFile & endFile")
  }
  
  ## --- Parse the input url & get page urls ----------------------------------
  h1 <- htmlParse(inUrl,useInternalNodes=T)
  l1 <- unique(xpathSApply(h1,"//div[@id='select_main']/*/option[contains(@value,'http:')]",function(u) xmlAttrs(u)["value"]))
  
  ## --- Render each page into seperate file ----------------------------------
  i <- 0
  for (line in l1){
    h1 <- htmlTreeParse(line,useInternalNodes=T)
    t1 <- xpathApply(h1, "//div[@class='tel_content']")
    
    #Write each parsed one as one xml file.
    for (j in t1){
      i <- i + 1
      outFileName=paste(tempPath,"/newFile",formatC(i,width=6,format="d",flag=0),sep="")
      saveXML(j,outFileName,encoding = "Binary")
    }
  }
  
  
  
  ## --- Render each page into seperate file ----------------------------------
  l <- list.files(path = tempPath,pattern = "*newFile*", full.names = TRUE)
  file.append("tempFile",beginFile)
  file.append("tempFile",l)
  file.append("tempFile",endFile)
  resFile <- paste(resPath,"/",novelName,".html",sep="")
  file.rename("tempFile",resFile)
  return(resFile)
}