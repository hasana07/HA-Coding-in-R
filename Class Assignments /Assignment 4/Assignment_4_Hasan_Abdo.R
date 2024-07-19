#Coding in R Assignment 4 - Hasan Abdo
#Cleaning Martians Data

#Reading data into data frame
#Used function read.csv to load csv file. Note to reviewer, make sure the file is in your own working directory and that you change the file path. Argument header= TRUE indicate there is a header.  
ufo_data <- read.csv("~/Documents/BTC1855 Coding in R/HA-Coding-in-R/Class Assignments /Assignment 4/ufo_subset.csv", header = TRUE)

#Loading tidyr and dplyr packages for later use 
library("dplyr")
library("tidyr")

#Glimpse function is similar to str, showing me the structure of the data withing the data frame.
#No structural issues jump out at me from the start. 
#I noticed that there are space or "" values within the column "country", so I viewed the whole data set and noticed this issue in other columns. I need to convert these spaces into NAs for easier manipulation/identification larer on.
glimpse(ufo_data)

#Assigning spaces (missing values) as NAs for the whole data frame. 
ufo_data[ufo_data == ""] <- NA 


#Downstream analysis will require the variables 'country', 'shape' and 'duration seconds'

#Checking for missing-ness in country 
which(is.na(ufo_data$country))
#There are many "missing" or NA values in country 
#Checking for missing-ness in shape
which(is.na(ufo_data$shape))
#There are many "missing" or NA values in shape
#Checking for missing-ness in duration seconds 
any(is.na(ufo_data$duration.seconds))
#There are no "missing" or NA values in duration seconds 


#Checking for inconsistencies/data that doesn't make sense 
#For country 
unique(ufo_data$country)
#The values here seem fine
#For shape
unique(ufo_data$shape)
#There are "unknown" shape values, and "other" shape values. Here, I am assuming "unknown" shape values mean that the shape seen was unknown, and "other" shapes means the same thing as unknown since they were not categorized as separate  distinct observations.
ufo_data$shape[ufo_data$shape == "other"] <- "unknown"


#Checking for outliers
summary(ufo_data$duration.seconds)
#The max value shown here is 82800000 seconds, which is 958 days !
#I think this is too large of a value (to be sighting the UFO for that long).
#I will exclude all values greater than a week, which is 604800 seconds. (I chose this value at random, I felt it doesn't make sense to keep observing a UFO past a full week).
#Filter function here to only add rows with seconds under 604800
new_ufo <- ufo_data %>% 
  filter(duration.seconds < 604800)


#Identifying and removing hoaxes
no_hoax <- new_ufo %>% 
  filter(!grepl("NUFORC", comments))

#Adding report delay column

#creating a new data frame to add the new column
rep_delay <- no_hoax
#need to convert the character value dates to POSIXct
library(lubridate)

#Changing the character values of "date_timr" and "date_posted" to POSIXct in order to subtract the values. 
rep_delay$datetime <- ymd_hm(rep_delay$datetime)

rep_delay$date_posted <- dmy(rep_delay$date_posted, tz = "UTC")

#Adding column called "report_delay"
rep_delay <- rep_delay %>% 
  mutate(report_delay = date_posted - datetime)

#Changing the column values from seconds to days by dividing by 86400.
#Using as.numeric to switch the values from POSIXct to numeric.
rep_delay$report_delay <- as.numeric(rep_delay$report_delay/86400)


#removing the rows where the sighting was reported before it happened.
#filter out for negative values
rep_delay <- rep_delay %>% 
  filter(report_delay > 0)








