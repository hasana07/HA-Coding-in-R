#Coding in R Assignment 4 - Hasan Abdo
#Cleaning Martians Data

#Reading data into data frame
#Used function read.csv to load csv file. Note to reviewer, make sure the file is in your own working directory and that you change the file path. Argument header= TRUE indicate there is a header.  
ufo_data <- read.csv("~/Documents/BTC1855 Coding in R/HA-Coding-in-R/Class Assignments /Assignment 4/ufo_subset.csv", header = TRUE)

#loading tidyr and dplyr packages for later use 
library("dplyr")
library("tidyr")

#Glimpse function is similar to str, showing me the structure of the data withing the data frame.
#I noticed that there are space or "" values within the column "country", so I viewed the whole data set and noticed this issue in other columns. I need to convert these spaces into NAs for easier manipulation/identification larer on.
glimpse(ufo_data)
#Assigning spaces (missing values) as NAs for the whole data frame. 
ufo_data[ufo_data == ""] <- NA 

