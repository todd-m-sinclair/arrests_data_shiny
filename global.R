# Helper file, runs at launch. Accessible to both ui.R and server.R objects

library(shiny)
library(shinydashboard)
library(shinycssloaders)
library(DT)
library(ggcorrplot)
library(tidyverse)
library(plotly)
library(ggplot2)
library(ggtext)
library(maps)
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
my_data = my_data %>% 
  mutate(State=states)

str(my_data)

#Choices for selectInput - without States column
c1 = my_data %>% select(-State) %>% names

#Choices for selectInput - without States and UrbanPopoulations column
c2 = my_data %>% select(-c("State", "UrbanPop")) %>% names

####Preparing data for Arrests Map ####
# map data for US states boundaries using the maps package
# map_data from ggplot package
# map_data() converts data fom maps package into a dataframe which can be further used for mapping

state_map <- map_data("state") # state from maps package contains information required to create the US state boundaries
# state_map %>% str() # you can see that state_map has a region column. region column has US state names but in lower case


# convert state to lower case
my_data1 = my_data %>% 
  mutate(State = tolower(State))  # converting the state names from USArrests dataset to lower case so we can later merge the maps data to our dataset


## Add the latitude, longitude and other info needed to draw the ploygon for the state map
# For the state boundaries available - add the USAArrests info.
# Note that Alaska and Hawaii boundaries are not available, those rows will be omitted in the merged data
# right_join from dplyr package
merged =right_join(my_data1, state_map,  by=c("State" = "region"))

# Add State Abreviations and center locations of each states. Create a dataframe out of it
st = data.frame(abb = state.abb, stname=tolower(state.name), x=state.center$x, y=state.center$y)

# Join the state abbreviations and center location to the dataset for each of the observations in the merged dataset
# left_join from dplyr package
# there is no abbreviation available for District of Columbia and hence those rows will be dropped in the outcome
new_join = left_join(merged, st, by=c("State" = "stname"))




