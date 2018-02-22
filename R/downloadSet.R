#' downloadSet - This makes download set of novels.
#' @author Siva Sunku
#' @keywords download
#' 
#' @param pageUrl - url of set of files
#' @param resPath - Where should be the result file sit? folder name.
#' @param tempStart - If you want to start from any adhoc sequence.
#' @export
#' 
downloadSet <- function(pageUrl,resPath = NULL,tempStart = 1,debugFlag = TRUE){
  h1 <- htmlTreeParse(pageUrl,useInternalNodes=T)
  urls  <- unique(xpathSApply(h1, "//div[@class='thumb_title']/a/@href"))
  value <- xpathSApply(h1, "//div[@class='thumb_title']",xmlValue)
  
  for ( i in tempStart:length(urls) ){
    if (debugFlag){
      print(sprintf("In downloadSet At: %s - Started Novel : %s, %s of %s : url - %s",Sys.time(),value[i],i,length(urls),urls[i]))
    }
    
    makeNovel(inUrl = urls[i],novelName = value[i],resPath = resultPDF,debugFlag = debugFlag)
    if (debugFlag){
      print(sprintf("In downloadSet At: %s - Completed Novel : %s, %s of %s : url - %s",Sys.time(),value[i],i,length(urls),urls[i]))
    }
  }

}