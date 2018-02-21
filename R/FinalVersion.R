library(RCurl)
library(XML)
library(xml2)
source("R/makeNovel.R")
source("R/downloadSet.R")


## --- Page1 novels to be downloaded
page1 <- "http://www.teluguone.com/grandalayam/books/novels.html"
resultPDF <- "E:/R/Projects/pdfNovels"

downloadSet <- function(pageUrl,resPath = NULL){
  h1 <- htmlTreeParse(page1,useInternalNodes=T)
  urls  <- unique(xpathSApply(h1, "//div[@class='thumb_title']/a/@href"))
  value <- xpathSApply(h1, "//div[@class='thumb_title']",xmlValue)

  for ( i in 6:nrow(urls) ){
    s <- sprintf("Started Novel : %s, %s of %s : url - %s",value[i],i,nrow(urls),urls[i])
    print(s)
    
    makeNovel(inUrl = urls[i],novelName = value[i],resPath = resultPDF)
    
    s <- sprintf("Completed Novel : %s, %s of %s : url - %s",value[i],i,nrow(urls),urls[i])
    print(s)
  }
}


downloadSet(page1,resPath = resultPDF)