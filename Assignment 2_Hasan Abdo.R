#Coding in R Assignment 2 - Hasan Abdo

#Question 1 
#Prompt the User to enter a three digit positive number

num <- readline(prompt = "Please enter a three digit positive number: ")
num <- as.numeric(num)

#Question 2
#Want to check if the number entered is numeric

if (!is.na(num)) {
  print(paste("The number you have entered is", num))
} else {
  print("The value you have entered is not a numeric value.")
}

#Question 3
#Check for Armstrong number