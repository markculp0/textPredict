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
      
      # Get input string
      inText <- input$box1
      
      # Convert to lower
      inText <- tolower(inText)
      
      # Ensure text is latin chars
      inText <- iconv(inText, to = "latin1")
      
      # Remove extended latin chars
      inText <- gsub("[\x7b-\xff]","",inText)
      
      # Remove certain oddities
      inText <- gsub("(\\s)-(\\s)"," ",inText) # Solo dashes
      inText <- gsub("(\\s)-(\\w)"," \\2",inText) # Leading dashes
      inText <- gsub("(\\w)-(\\s)","\\1 ",inText) # Trailing dashes
      inText <- gsub("(\\w)#(\\s)","\\1 ",inText) # Trailing pounds
      
      # Some fixes for contractions
      inText <- gsub("\\drd", " ", inText) 
      inText <- gsub("\\dth", " ", inText) 
      inText <- gsub("\\sdon't\\s", " do not ", inText) 
      inText <- gsub("\\sdont\\s", " do not ", inText)
      
      inText <- gsub("it's", "it is", inText) 
      inText <- gsub("'twas", "it was", inText)
      inText <- gsub("\\stwas\\s", " it was ", inText)
      inText <- gsub("'tis", "it is", inText) 
      
      inText <- gsub("won't", "will not", inText)
      inText <- gsub("\\swont\\s", " will not ", inText)
      inText <- gsub("can't", "can not", inText) 
      inText <- gsub("\\scant\\s", " can not ", inText)
      
      inText <- gsub("let's", "let us", inText) 
      inText <- gsub("\\slets\\s", " let us ", inText) 
      inText <- gsub("that's", "that is", inText)
      inText <- gsub("\\sthats\\s", " that is ", inText)
      
      inText <- gsub("'m\\s", " am ", inText)
      inText <- gsub("\\im\\s", " i am ", inText)
      inText <- gsub("n't\\s", " not ", inText) 
      inText <- gsub("\\sdont\\s", " do not ", inText)
      inText <- gsub("\\swont\\s", " will not ", inText)
      inText <- gsub("\\scant\\s", " can not ", inText)
      
      inText <- gsub("'re\\s", " are ", inText)
      inText <- gsub("'d\\s", " would ", inText) 
      inText <- gsub("'ll\\s", " will ", inText)
      inText <- gsub("'ve\\s", " have ", inText)
      
      # Remove numbers 
      inText <- gsub("[0-9]","",inText)
      
      # Remove punctuation except for dashes
      inText <- gsub("-", "\001", inText, fixed = TRUE)
      inText <- gsub("[[:punct:]]+", "", inText)
      inText <- gsub("\001", "-", inText, fixed = TRUE)
      
      # Split input string
      words <- strsplit(inText," ",fixed = T)[[1]]
      
      # Get last word in text string
      lastWord2Cnt <- length(words)
      lastWord2 <-  words[lastWord2Cnt]
      
      # Get second to last word
      lastWord1Cnt <- lastWord2Cnt - 1
      lastWord1 <- words[lastWord1Cnt]
      
      # Remove certain oddities
      #lastWord1 <- gsub("(\\s)-(\\s)","",lastWord1) # Solo dashes
      #lastWord2 <- gsub("(\\s)-(\\s)","",lastWord2) # Solo dashes
      
      # Get number of words in phrase
      #word2Chars <- nchar(lastWord2)
      #word1Chars <- nchar(lastWord1)
      
      # Get substrings of lastWord2
      ltr1 <- substr(lastWord2,1,1)
      ltr2 <- substr(lastWord2,1,2)
      ltr3 <- substr(lastWord2,1,3)
      
      # ========== begin wordFile select ============
      
      # Open appropriate wordFile
      if (ltr2 >= "a" & ltr2 < "aa") {
        wordFile <- readRDS("n1/aa.rds")
      } else if (ltr2 >= "aa" & ltr2 <= "am") {
        wordFile <- readRDS("n1/a1.rds")  
      } else if (ltr2 == "an") {
        wordFile <- readRDS("n1/a2.rds")
      } else if (ltr2 >= "ao" & ltr2 <= "az") {
        wordFile <- readRDS("n1/a3.rds")
      } else if (ltr2 >= "b" & ltr2 <= "bl") {
        wordFile <- readRDS("n2/b1.rds")
      } else if (ltr2 >= "bm" & ltr2 <= "bz") {
        wordFile <- readRDS("n2/b2.rds")
      } else if (ltr2 >= "c" & ltr2 <= "cn") {
        wordFile <- readRDS("n2/c1.rds")
      } else if (ltr2 >= "co" & ltr2 <= "cz") {
        wordFile <- readRDS("n2/c2.rds")
      } else if (ltr2 >= "d" & ltr2 <= "dn") {
        wordFile <- readRDS("n3/d1.rds")
      } else if (ltr2 >= "do" & ltr2 <= "dz") {
        wordFile <- readRDS("n3/d2.rds")
      } else if (ltr1 == "e") {
        wordFile <- readRDS("n3/e.rds")
      } else if (ltr2 >= "f" & ltr2 <= "fn") {
        wordFile <- readRDS("n3/f1.rds")
      } else if (ltr2 >= "fo" & ltr2 <= "fz") {
        wordFile <- readRDS("n3/f2.rds")
      } else if (ltr1 == "g") {
        wordFile <- readRDS("n4/g.rds")
      } else if (ltr2 >= "h" & ltr2 <= "hf") {
        wordFile <- readRDS("n4/h1.rds")
      } else if (ltr2 >= "hg" & ltr2 <= "hz") {
        wordFile <- readRDS("n4/h2.rds")
      } else if (ltr2 >= "i" & ltr2 <= "im") {
        wordFile <- readRDS("n4/i1.rds")
      } else if (ltr2 == "in") {
        wordFile <- readRDS("n4/i2.rds")
      } else if (ltr2 >= "io" & ltr2 <= "iz") {
        wordFile <- readRDS("n4/i3.rds")
      } else if (ltr1 == "j" | ltr1 == "k") {
        wordFile <- readRDS("n4/jk.rds")
      } else if (ltr2 >= "l" & ltr2 <= "li") {
        wordFile <- readRDS("n4/l1.rds")
      } else if (ltr2 >= "lj" & ltr2 <= "lz") {
        wordFile <- readRDS("n4/l2.rds")
      } else if (ltr2 >= "m" & ltr2 <= "mi") {
        wordFile <- readRDS("n5/m1.rds")
      } else if (ltr2 >= "mj" & ltr2 <= "mz") {
        wordFile <- readRDS("n5/m2.rds")
      } else if (ltr1 == "n") {
        wordFile <- readRDS("n5/n.rds")
      } else if (ltr2 >= "o" & ltr2 <= "om") {
        wordFile <- readRDS("n5/o1.rds")
      } else if (ltr2 >= "on" & ltr2 <= "oz") {
        wordFile <- readRDS("n5/o2.rds")
      } else if (ltr2 >= "p" & ltr2 <= "pm") {
        wordFile <- readRDS("n5/p1.rds")
      } else if (ltr2 >= "pn" & ltr2 <= "pz") {
        wordFile <- readRDS("n5/p2.rds")
      } else if (ltr1 == "q" | ltr1 == "r") {
        wordFile <- readRDS("n5/qr.rds")
      } else if (ltr2 >= "s" & ltr2 <= "si") {
        wordFile <- readRDS("n6/s1.rds")
      } else if (ltr2 >= "sj" & ltr2 <= "sp") {
        wordFile <- readRDS("n6/s2.rds")
      } else if (ltr2 >= "sq" & ltr2 <= "sz") {
        wordFile <- readRDS("n6/s3.rds")
      } else if (ltr2 >= "t" & ltr2 <= "tg") {
        wordFile <- readRDS("n6/t1.rds")
      } else if (ltr3 >= "th" & ltr3 <= "the") {
        wordFile <- readRDS("n6/t2.rds")
      } else if (ltr3 >= "thi" & ltr2 <= "tn") {
        wordFile <- readRDS("n6/t3.rds")
      } else if (ltr2 >= "to" & ltr2 <= "tz") {
        wordFile <- readRDS("n6/t4.rds")
      } else if (ltr1 == "u" | ltr1 == "v") {
        wordFile <- readRDS("n7/uv.rds")
      } else if (ltr2 >= "w" & ltr2 <= "we") {
        wordFile <- readRDS("n7/w1.rds")
      } else if (ltr2 >= "wf" & ltr2 <= "wh") {
        wordFile <- readRDS("n7/w2.rds")
      } else if (ltr2 >= "wi" & ltr2 <= "wz") {
        wordFile <- readRDS("n7/w3.rds")
      } else if (ltr1 == "x" | ltr1 == "y" | ltr1 == "z") {
        wordFile <- readRDS("n7/xyz.rds")
      }
      # ============== end wordFile select ===============
      
      
      # =============== begin word search ===============
      
      # Search with 2 words
      m4 <- with(wordFile, wordFile[wrd1 == lastWord1 & wrd2 == lastWord2,])
      
      # Match with 2 words
      if (nrow(m4) > 0) 
      {lastWord3 <- m4[1,3]
      # No match w 2 words
      } else {  # outer else
        # Search w empty word 1
        m4 <- with(wordFile, wordFile[wrd1 == "" & wrd2 == lastWord2,])
        # Match with empty word 1
        if (nrow(m4) > 0) {
          lastWord3 <- m4[1,3]
        } else {  # inner else
          # Search w 1 word
          m4 <- with(wordFile, wordFile[wrd2 == lastWord2,])
          if (nrow(m4) > 0) {
            lastWord3 <- m4[1,3]
          } else {
            lastWord3 <- "dude"}
        } # end inner else
      } # end outer else 
      
      # ============= end word search ===============
      
      
      # Some fixes for failing to preserve single quotes
      if (lastWord3 == "id") {lastWord3 <- "i'd"}
      if (lastWord3 == "hed") {lastWord3 <- "he'd"}
      if (lastWord3 == "theyd") {lastWord3 <- "they'd"}
      
      # Fixes to user's text also
      inText <- gsub("\\bid\\b","i'd",inText)
      inText <- gsub("\\bhed\\b","he'd",inText)
      inText <- gsub("\\btheyd\\b","they'd",inText)
      
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
