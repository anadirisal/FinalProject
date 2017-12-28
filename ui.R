#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

library(shiny)
# library(shinythemes)

shinyUI(fluidPage(
  # theme=shinytheme('cosmo'),
  titlePanel('Word Prediction App - quick and crude'),
  
  
  sidebarLayout(
    
    # Sidebar with a text input
    sidebarPanel(
      textInput("text", label=h4('Text Input'), placeholder='Enter at least two words'),
      h5('You typed:'),
      verbatimTextOutput('value')
    ),
    
    # Show the prediction
    mainPanel(
      h4('Top suggestions:'),
      verbatimTextOutput("prediction")
    )
  ),
  
  hr(),
  
  fluidRow(
    column(3, h5('Created by A. Risal'),
           h5('https://sg.linkedin.com/in/anadirisal'))
  )
  
  
))