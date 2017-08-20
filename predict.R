
# =======
# Predict
# =======

#textStr <- c("I love dogs", "I hate cats")
#textStr <- paste(textStr[1], " and me.")

#inText <- "I love dogs"
#words <- strsplit(inText," ",fixed = T)[[1]]

#length(words)

# ---

wrdFile <- readRDS("n1/a1.rds")

# m4 <- matrix(numeric(20),nrow=5,ncol=4)
m4 <- matrix(character(20),nrow=5,ncol=4)

# Is there (3 grep vars)
#lastWord2 <- "about"
#lastWord1 <- "poem"

#Is not there
lastWord2 <- "adampants"
lastWord1 <- "adam" # not there

#End of list
#lastWord2 <- "amy"
#lastWord1 <- "yogurtblob"

# wrdLine <- grepl("adam",wrdFile$wrd2)

# Straight srch
m4 <- with(wrdFile, wrdFile[wrd1 == lastWord1 & wrd2 == lastWord2,])

# Match with 2 words
if (nrow(m4) > 0) 
  {lastWord3 <- m4[1,3]
# No match w 2 words
} else {  # outer else
  # Search w empty word 1
  m4 <- with(wrdFile, wrdFile[wrd1 == "" & wrd2 == lastWord2,])
  # Match with empty word 1
  if (nrow(m4) > 0) {
    lastWord3 <- m4[1,3]
  } else {  # inner else
    # Search w 1 word
    m4 <- with(wrdFile, wrdFile[wrd2 == lastWord2,])
    if (nrow(m4) > 0) {
      lastWord3 <- m4[1,3]
    } else {
    lastWord3 <- "dude"}
  } # end inner else
} # end outer else 

# if (nrow(m4) == 0 | m4[1,2] == "")
# or
# W grepl
# wrdLine <- with(wrdFile, wrdFile[grepl(lastWord1,wrd1) & grepl(lastWord2,wrd2),])
# lastWord3 <- wrdFile[wrdLine,3]


# ================ end search =================

#blob <- substr(lastWord2,1,4)
#blob <- paste("^",blob)
#m4 <- with(wrdFile, wrdFile[wrd2 == blob,])

lastWord2 <- "cat"
#lastWord1 <- "poem"

ltr1 <- substr(lastWord2,1,1)
ltr2 <- substr(lastWord2,1,2)
ltr3 <- substr(lastWord2,1,3)
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


# ================ end file select =================


