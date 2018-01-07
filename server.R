#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


# library(dplyr)
# setwd("/Users/anadirisal/Dropbox/courses-master/09_DevelopingDataProducts/SwiftKeyRisal")
# getwd()
df_2gram <- read.csv("df2.csv", stringsAsFactors = FALSE)
df_3gram <- read.csv("df3.csv", stringsAsFactors = FALSE)
df_4gram <- read.csv("df4.csv", stringsAsFactors = FALSE)
df_5gram <- read.csv("df5.csv", stringsAsFactors = FALSE)

predict_word <- function(x) {
  
  x <- tolower(x)
  
  #remove Numerals
  # x <- gsub("[0-9](?:st|nd|rd|th)", "", x, ignore.case=F, perl=T) 
  # print (c("lower =",x))
  #remove Punctuation
  # x <- gsub("[.\\-!]", " ", x, ignore.case=F, perl=T) 
  
  #trim Whitespace before and after
  x <- gsub("^\\s+|\\s+$", "", x) 
  
  splitted <- unlist(strsplit(x, split=" "))
  
  N <- length(splitted)
  
  if(N < 1)
    stop('A word at least please.')
  
  if(N >4){
    x<- sub('.*?(\\w+( \\w+){3})$', '\\1', x)
    splitted <- unlist(strsplit(x, split=" "))
    
    N <- 4
  }
  if (N==4) {
    index <- which(df_5gram$Ngram == x)
    predicted <- df_5gram$result[index]
    if (identical(predicted, character(0))){
      x<- sub('.*?(\\w+( \\w+){2})$', '\\1', x)
      splitted <- unlist(strsplit(x, split=" "))
      
      N <- 3
    }
    
  }
  if (N==3) {
    index <- which(df_4gram$Ngram == x)
    predicted <- df_4gram$result[index]
    if (identical(predicted, character(0))){
      x<- sub('.*?(\\w+( \\w+){1})$', '\\1', x)
      splitted <- unlist(strsplit(x, split=" "))
      
      N <- 2
    }
    
  }
  if (N==2) {
    index <- which(df_3gram$Ngram == x)
    predicted <- df_3gram$result[index]
    if (identical(predicted, character(0))){
      x<- sub('.*?(\\w+( \\w+){0})$', '\\1', x)
      splitted <- unlist(strsplit(x, split=" "))
      
      N <- 1
    }
    
  }
  
  
  if (N==1) {
    index <- which(df_2gram$Ngram == x)
    predicted <- df_2gram$result[index]
    
    
  }
  
  
  
  # atmost N answer provided, here N is 1 
  
  if (length(predicted) > 0) {
    
    predicted[1]
    
  }
  else
    print('No words found...Delete words or type new ones!')
  
  
  
}



shinyServer(
  function(input, output){
    
    output$value <- renderPrint({ input$text })
    output$prediction <- renderPrint({predict_word(input$text)})
    
  }
)