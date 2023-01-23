# Class notes jan 17, 2023

#Week 2 begins now :) 
#Hashtag means everything to the right on that line is for humans
#It won't be read as R code
TRUE # is a special term, means yes or 1
FALSE #is special as well, means no, or 0

TAB #helps autocomplete
 #,comma separates argument to a function
#Find out what argument, function,
# # Ctrl+Shift+C makes it all purple/hashtagged
# # Poop
#ignore.case = TRUE to find a file now knowing about caps
#"Recursive"?
#Ctrl + Alt + B, repeat all lines of code
#Broom above environment clears it all out
#Dollar sign $ is for column names
#Wingspan is a DATA FRAME (Got rows and columns) 
# Data frame: 2 dimensional, has rows and columns
# vector: 1-dimensional, numbers in order (1 column/1 row)
#plot, assign value to path, 

# rmarkdown::render("foo.Rmd"). --> Ask about markdown rendering?

# ? question mark before command brings up help menu
# readLines THE L IS CAPITALIZED to read lines withing a file where n=the number of lines read
#readLines does LINES not VALUES
# TRUE is [1] FALSE is [0] just binary code

#1/19/23
#square-bracket notation lets you pick elements from an object
# the object of a csv list is a character vector.
# [1] means give me the FIRST ELEMENT of that CHARACTER VECTOR
# readLines lets you read in 1 line at a time
#it makes a character vector (not listed in the environment) where each line is an element
#read.csv pays attention to COMMAS to split lines into columns
# ^ up carrot means beginning, $ means ending.
# example for ends with .csv = ".csv$"
# example for ends in lowercase t = "t$"
# getwd()
getwd() # get directory of this current directory

