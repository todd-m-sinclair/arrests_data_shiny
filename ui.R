# UI elements
library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "1973 US Arrests with R & Shiny Dashboard",
                  titleWidth = 650,
                  tags$li(class = "dropdown", 
                          tags$a(href="https://www.youtube.com/watch?v=tlOBVZx8Hy0&list=PL6wLL_RojB5xNOhe2OTSd-DPkMLVY9DfB&index=76", 
                                 icon("youtube"), "Tutorial", target="_blank")),
                  tags$li(class = "dropdown", 
                          tags$a(href="https://www.linkedin.com/in/toddsin/", 
                                 icon("linkedin"), "My LinkedIn", target="_blank")),
                  tags$li(class = "dropdown", 
                          tags$a(href="https://github.com/todd-m-sinclair", 
                                 icon("github"), "My GitHub", target="_blank"))
                  ),
  dashboardSidebar(
    #sidebarmenu
    sidebarMenu(
      id = "sidebar",
      
      #first menuitem
      menuItem("Dataset", tabname = "data", icon=icon("database")),
      menuItem("visualization", tabname = "viz" , icon=icon("charl-line")),
      menuItem("Choropleth Map", tabname ="map" , icon=icon("map"))
    )
  ),
  dashboardBody()
)