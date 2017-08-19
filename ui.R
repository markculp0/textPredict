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
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
     sidebarPanel(
       #h3("Enter two words:"),
       textInput("box1", "Enter text:", value = "na")
     ),
    
    # Show a plot of the generated distribution
    mainPanel(
       # plotOutput("distPlot")
      textOutput("out1")
    )
  )
))
