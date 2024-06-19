#Coding in R Assignment 2 - Hasan Abdo

#Question 1 
#Prompt the User to enter a three digit positive number

num <- readline(prompt = "Please enter a three digit positive number: ")
num <- as.numeric(num)

#Question 2
#Want to check if the number entered is numeric & 3 digit positive number 
#Print appropriate messages depending on the condition which the user input meets

if (!is.na(num) && num >= 100 && num <= 999) {
  print(paste("The number you have entered is", num))  
} else {
  print("The value you have entered is either not a numeric value, or not a 3-digit positive number.")
}

#Question 3
#Check for Armstrong number

#I need to split the number from the user input so that I can cube the individual components and then add them together
#I found the function "strsplit" can do this, however I need to convert my numeric value to a character value before applying this function
num_string <- as.character(num) 
num_split <- strsplit(num_string, split = "")
#I tried cubing the result, however I got an error and realized the product was a list that needs to be converted to a vector in order to do an arithmetic operation to it
#I found a function called "unlist" that can do just that
num_split <- unlist(num_split) 
#Still, in order to not get an error for a non-numeric argument, I need to convert this vector back to numeric
num_split <- as.numeric(num_split) 
#Now I can verify whether the User input "num" is indeed an Armstrong number by first cubing the individual values within the number.
num_cube <- num_split^3
#I use the "sum" function to add the cubed elements within the vector. 
num_sum <- sum(num_cube)

#Question 4
#Display a message to indicate whether the User used an Armstrong number or not

if (num == num_sum) {
  print(paste(num, "is an Armstrong number !"))
} else {
  print(paste(num, "is NOT a 3-digit Armstrong number."))
}
