# Computation and reactivity
library(DT)

function(input, output, session){
  #Structure
  output$structure <-renderPrint(
    my_data %>% 
      str()
  )
  
  #Summary
  output$summary <-renderPrint(
    my_data %>% 
      summary()
  )
  
  #Datatable
  output$dataT <-renderDataTable(
    my_data
  )
}