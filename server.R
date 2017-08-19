#
# This is the server logic of the Shiny Text Prediction
# web application. 
#
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  # Make prediction
  observeEvent(input$predButton, { 
    
    # Get text box input
    output$out1 <- renderText({
      
      inText <- input$box1
      words <- strsplit(inText," ",fixed = T)[[1]]
      lastWord3 <- "don't know yet"
      
      # Get last word in text string
      lastWord2Cnt <- length(words)
      lastWord2 <-  words[lastWord2Cnt]
      
      # Get second to last word
      lastWord1Cnt <- lastWord2Cnt - 1
      lastWord1 <- words[lastWord1Cnt]
      
      # Get number of words in phrase
      word2Chars <- nchar(lastWord2)
      word1Chars <- nchar(lastWord1)
      
      
      # Add predicted word to phrase
      paste(inText, lastWord3)
      
    }) # end renderText()
  }) # end observeEvent()
  
  
  # Clear text boxes
  observeEvent(input$clearButton, {
    
    # Clear input box
    # updateTextInput(session, "box1", value = " ")
    
    # Clear output box
    output$out1 <- renderText({
      paste("")
    })
    
    
  })
  
})
