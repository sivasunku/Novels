
novelFromDF <- function(urls) {
  
  for (i in 1:nrow(urls)){
    makeNovel(urls[i,1],urls[i,3])
    print("Completed:")
    print(i)
  }
}  
