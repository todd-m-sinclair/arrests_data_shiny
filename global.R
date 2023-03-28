# Helper file, runs at launch. Accessible to both ui.R and server.R objects

library(tidyverse)
# USArrests dataset

my_data <- USArrests

# structure of data
my_data %>% 
  str()

#summary of data
my_data %>% 
  summary()

#first few observations
my_data %>% 
  head()

#assign row names to ojbect
states=rownames(my_data)

#Add column to data set
my_data = my_data %>% mutate(State=states)

str(my_data)