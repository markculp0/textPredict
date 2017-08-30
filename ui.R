#
# This is the user-interface definition of the Shiny Text 
# Prediction web application. 
#
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Text Prediction App"),
  
  # Sidebar with input for text to predict 
  sidebarLayout(
     sidebarPanel(
       #h3("Enter two words:"),
       textInput("box1", "Enter text:", value = "")
     ),
    
    # Show a plot of the generated distribution
    mainPanel(
      # plotOutput("distPlot")
      
      actionButton("predButton", "Predict"),
      actionButton("clearButton", "Clear"),
      textOutput("out1"),
      h4("Alternative predictions:"),
      textOutput("out2")
    )
  )
))
