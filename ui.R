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
      menuItem("Dataset", tabName = "data", icon=icon("database")),
      menuItem("Visualization", tabName = "viz" , icon=icon("chart-line")),
      menuItem("Choropleth Map", tabName ="map" , icon=icon("map"))
    )
  ),
  dashboardBody(
    tabItems(
      #first tab item
      tabItem(tabName = "data",
              #tab box
              tabBox(id="t1", width=12,
                     tabPanel("About", icon=icon("address-card"), h4("tab panel 1 placeholder")),
                     tabPanel("Data", icon=icon("address-card"), h2("tab panel 2 placeholder")),
                     tabPanel("Structure", icon=icon("address-card"),h2("tab panel 3 placeholder")),
                     tabPanel("Summary Stats", icon=icon("address-card"),h2("tab panel 4 placeholder"))
              )
      ),
      #second tab item
      tabItem(tabName = "viz",
              #tab box
              tabBox(id="t2", width=12,
                     tabPanel("Crime Trends By State", value="trends", h4("tab panel 1 placeholder UI")),
                     tabPanel("Distribution", value="distro", h2("tab panel 2 placeholder UI")),
                     tabPanel("Correlation Matrix", h2("tab panel 3 placeholder UI")),
                     tabPanel("Arrest types and Urban Population", value="relations",h2("tab panel 4 placeholder UI"))
              )
      )
    )
  )
)