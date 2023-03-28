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
      selectInput(inputId = "var1" , label= "Select the variable", choices =  c1, selected = "Rape" ),
      menuItem("Choropleth Map", tabName ="map" , icon=icon("map"))
    )
  ),
  dashboardBody(
    tabItems(
      #first tab item
      tabItem(tabName = "data",
              #tab box
              tabBox(id="t1", width=12,
                     tabPanel("About", icon=icon("address-card"), 
                              fluidRow(
                                column(width = 8, tags$img(src="crime.jpg", width =600 , height = 300),
                                       tags$br() , 
                                       tags$a("Photo by Campbell Jensen on Unsplash"), align = "center"),
                                column(width = 4, tags$br() ,
                                       tags$p("This data set comes along with base R and contains statistics, in arrests per 100,000 residents for assault, murder, and rape in each of the 50 US states in 1973. Also, given is the percent of the population living in urban areas.")
                                )
                              )
                              
                              
                     ), 
                     tabPanel("Data", icon=icon("address-card"), dataTableOutput("dataT")),
                     tabPanel("Structure", icon=icon("address-card"), verbatimTextOutput("structure")),
                     tabPanel("Summary Stats", icon=icon("address-card"), verbatimTextOutput("summary"))
              )
      ),
      #second tab item
      tabItem(tabName = "viz",
              #tab box
              tabBox(id="t2", width=12,
                     tabPanel("Crime Trends By State", value="trends", h4("tab panel 1 placeholder UI")),
                     tabPanel("Distribution", value="distro", plotlyOutput("histplot")),
                     tabPanel("Correlation Matrix", h2("tab panel 3 placeholder UI")),
                     tabPanel("Arrest types and Urban Population", value="relations",h2("tab panel 4 placeholder UI"))
              )
      ),
      #third tab item
      tabItem(tabName = "map",
              box(h1("placeholder UI"))
      )
    )
  )
)