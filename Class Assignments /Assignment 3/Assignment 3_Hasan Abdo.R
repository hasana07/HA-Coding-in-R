#Coding in R Assignment 2 - Hasan Abdo

#Created a dictionary of words and saved it as a .txt file. 
#File name is words.txt
#Note to reviewer, you may want to make sure the file words.txt is within your working directory for this code to run.
#Words generated using a random word generator found on https://www.randomlists.com/random-words , I did add a couple of my own words as well!

#Reading the word list into the program using read.table, where our words are placed in coloumn called words
wordfile <- read.table("words.txt", header = FALSE, stringsAsFactors = FALSE, col.names = "words")

#Converting the table into a character vector and placing it within variable word_list
word_list <- wordfile$words

#word which will be used for the game
random_word <- sample(word_list,1)

#getting length of random word in order to let the user know 
word_length <- nchar(random_word)           
                                                       
#telling the User how many letters their word has 
cat("Welcome to Hangman\nYour word has", word_length, "letters.")
