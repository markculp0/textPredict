#
# This is the server logic of the Shiny Text Prediction
# web application. 
#
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$out1 <- renderText(input$box1)
  
})
