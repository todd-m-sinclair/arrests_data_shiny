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
  
  output$scatter <- renderPlotly({
    # Create scatter plot for relationship using ggplot
    
    p <- my_data %>% ggplot(aes(x=get(input$var3), y=get(input$var4) )) +
      geom_point() +
      geom_smooth(method = get(input$fit)) +
      labs(title = paste("Relationship between", input$var3, "and", input$var4),
           x=input$var3,
           y=input$var4) +
      theme( plot.title = element_textbox_simple(size=10, halign=0.5))
    
    ggplotly(p)
  })
}