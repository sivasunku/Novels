library(RCurl)
library(XML)
library(xml2)
source("R/makeNovel.R")
source("R/downloadSet.R")

## ---- Download Completed Versions -------------------------------
## --- Page1 novels to be downloaded
##page1 <- "http://www.teluguone.com/grandalayam/books/novels.html"
##resultPDF <- "E:/R/Projects/pdfNovels/set1"
##downloadSet(pageUrl = page1,resPath = resultPDF,tempStart = 30)

##page2 <- "http://www.teluguone.com/grandalayam/books/novels30.html"
##resultPDF <- "E:/R/Projects/pdfNovels/set2"
#3downloadSet(pageUrl = page2,resPath = resultPDF)
  
## ---- Download In Progress       -------------------------------
page3 <- "http://www.teluguone.com/grandalayam/books/novels60.html"
resultPDF <- "E:/R/Projects/pdfNovels/Set3"
downloadSet(pageUrl = page3,resPath = resultPDF)

## ---- TBD----------------------- -------------------------------
page4 <- "http://www.teluguone.com/grandalayam/books/novels90.html"
resultPDF <- "E:/R/Projects/pdfNovels/Set4"
downloadSet(pageUrl = page4,resPath = resultPDF)

page5 <- "http://www.teluguone.com/grandalayam/books/novels120.html"
resultPDF <- "E:/R/Projects/pdfNovels/Set5"
downloadSet(pageUrl = page5,resPath = resultPDF)