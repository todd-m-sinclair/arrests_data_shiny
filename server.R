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
  
  output$histplot <- renderPlotly({
    
    # histogram
    p1 <- my_data %>%
      plot_ly() %>%
      add_histogram(x=~get(input$var1)) %>%
      layout(xaxis = list(title=paste(input$var1)))
    
    # box plot
    p2 <- my_data %>%
      plot_ly() %>%
      add_boxplot(x=~get(input$var1)) %>%
      layout(yaxis = list(showticklabels=F))
    
    #stack plots
    subplot(p2, p1, nrows =2, shareX = TRUE) %>% hide_legend() %>%
      layout(title="Distribution chart - Histogram and Boxplot", 
             yaxis = list(title="Frequency"))
    
  })
}