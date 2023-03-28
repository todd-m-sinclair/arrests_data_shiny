# Helper file, runs at launch. Accessible to both ui.R and server.R objects

library(tidyverse)
library(plotly)
library(ggplot2)
library(ggtext)
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

# Create scatter plot for relationship using ggplot

my_data %>% ggplot(aes(x=get(input$var3), y=get(input$var4) )) +
  geom_point() +
  geom_smooth(method = "lm")+
  labs(title = paste("Relationship between", input$var3, "and", input$var4),
       x=input$var3,
       y=input$var4) +
  theme( plot.title = element_textbox_simple(size=10, halign=0.5))

