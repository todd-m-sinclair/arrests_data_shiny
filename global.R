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

# Second menuItem visualization
# Create Histogram and boxplot for distribution tabPanel

# # histogram
# p1 <- my_data %>%
#   plot_ly() %>%
#   add_histogram(~get(input$var1)) %>%
#   layout(xaxis = list(title=paste(input$var1)))
# 
# # box plot
# p2 <- my_data %>%
#   plot_ly() %>%
#   add_boxplot(~get(input$var1)) %>%
#   layout(yaxis = list(showticklabels=F))
# 
# #stack plots
# subplot(p2, p1, nrows =2, shareX = TRUE) %>% hide_legend() %>%
#   layout(title="Distribution chart - Histogram and Boxplot", 
#          yaxis = list(title="Frequency"))

#Choices for selectInput - without States column
c1 = my_data %>% select(-State) %>% names

# Create scatter plot for relationship using ggplot

my_data %>% ggplot(aes(x=Rape, y=Assault)) +
  geom_point() +
  geom_smooth(method = "lm")+
  labs(title = "Relation between rape and assault arrests",
       x="Rape",
       y="Assault") +
  theme( plot.title = element_textbox_simple(size=10, halign=0.5))

