#' downloadSet - This makes download set of novels.
#' @author Siva Sunku
#' @keywords download
#' 
#' @param pageUrl - url of set of files
#' @param resPath - Where should be the result file sit? folder name.
#' @export
#' 
downloadSet <- function(pageUrl,resPath = NULL){
  h1 <- htmlTreeParse(page1,useInternalNodes=T)
  urls  <- unique(xpathSApply(h1, "//div[@class='thumb_title']/a/@href"))
  value <- xpathSApply(h1, "//div[@class='thumb_title']",xmlValue)
  
  for ( i in 1:nrow(urls) ){
    s <- sprintf("Started Novel : %s, %s of %s : url - %s",value[i],i,nrow(urls),urls[i])
    print(s)
    
    makeNovel(inUrl = urls[i],novelName = value[i],resPath = resultPDF)
    
    s <- sprintf("Completed Novel : %s, %s of %s : url - %s",value[i],i,nrow(urls),urls[i])
    print(s)
  }
}
