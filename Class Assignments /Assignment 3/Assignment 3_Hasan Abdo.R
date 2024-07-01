#Coding in R Assignment 2 - Hasan Abdo

#Created a dictionary of words and saved it as a .txt file. 
#File name is words.txt
#Note to reviewer, you may want to make sure the file words.txt is within your working directory for this code to run.
#Words generated using a random word generator found on https://www.randomlists.com/random-words , I did add a couple of my own words as well!


#Creating a function which will read the words from .txt file, can call on this function later 
read_words <- function() {
  
  #Reading the word list into the program using read.table, where our words are placed in coloumn called words
  wordfile <- read.table("words.txt", header = FALSE, stringsAsFactors = FALSE, col.names = "words")
  
  #Converting the table into a character vector and placing it within variable word_list
  word_list <- wordfile$words
  
  #Function returns vector of strings from the column words, so should return the word list. 
  return(word_list)
  
} #read_words function ends here

#Taking user guesses/input
#Creating a function for user guesses, which will check whether the user only inputs a single number, and an alphabetical letter
user_guess <- function() {
#Adding a repeat loop so the User is prompted till they enter a valid letter
   repeat {
#Adding user input and assigning it to variable "guess", tolower function makes sure the values entered are lowercase
    guess <- tolower(readline(prompt = "Please enter a single letter: "))
#If statement to check whether input is 1 character and is a letter from a-z, loop breaks if this condition checks
    if (nchar(guess) == 1 && grepl("[a-z]", guess)) {
      break #break the loop
#If condition is not satisfied, loop continues and asks for valid input.
    } else {
      cat("Invalid input. Please enter a single letter: ")
    }
   }
#After breaking loop, the function will return the valid value for "guess" variable.
  return(guess) 
}

#Making a function that will provide the user with the length of the chosen secret random word. 
hangman_word <- function(word_list, max_wrong_guesses = 8) {

# Read words from file, going back to function created "read_words"
  word_list <- read_words()
  
#Choose a random word from the list using sample function
  random_word <- sample(word_list, 1)
#Finding the length of the word using nchar
  word_length <- nchar(random_word)
#Welcome user and tell them of length of their word
#Inform the user about the number of wrong guesses allowed
  cat("Welcome to Hangman\nYour word has", word_length, "letters.\n")
  cat("You are allowed", max_wrong_guesses, "wrong guesses.\n")

      