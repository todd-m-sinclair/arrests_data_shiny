# Helper file, runs at launch. Accessible to both ui.R and server.R objects

library(tidyverse)
library(plotly)
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

# Second menuItem visualization
# Create Histogram and boxplot for distribution tabPanel

# histogram
p1 <- my_data %>%
  plot_ly() %>%
  add_histogram(~Rape) %>%
  layout(xaxis = list(title="Rape"))

# box plot
p2 <- my_data %>%
  plot_ly() %>%
  add_boxplot(~Rape) %>%
  layout(yaxis = list(showticklabels=F))

#stack plots
subplot(p2, p1, nrows =2, shareX = TRUE) %>% hide_legend() %>%
  layout(title="Distribution chart - Histogram and Boxplot", 
         yaxis = list(title="Frequency"))


#Choices for selectInput - without States column
c1 = my_data %>% select(-State) %>% names
