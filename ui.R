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
                          tags$a(href="https://github.com/todd-m-sinclair/arrests_data_shiny", 
                                 icon("github"), "My GitHub", target="_blank"))
                  ),
  dashboardSidebar(
    #sidebarmenu
    sidebarMenu(
      id = "sidebar",
      
      #first menuitem
      menuItem("Dataset", tabName = "data", icon=icon("database")),
      menuItem("Visualization", tabName = "viz" , icon=icon("chart-line")),
      
      conditionalPanel("input.sidebar == 'viz' && input.t2 == 'distro'", 
                       selectInput(inputId = "var1" , label ="Select the Variable" , choices = c1)),
      conditionalPanel("input.sidebar == 'viz' && input.t2 == 'trends' ", 
                       selectInput(inputId = "var2" , label ="Select the Arrest type" , choices = c2)),
      conditionalPanel("input.sidebar == 'viz' && input.t2 == 'relation' ", 
                       selectInput(inputId = "var3" , label ="Select the X variable" , choices = c1, selected = "Rape")),
      conditionalPanel("input.sidebar == 'viz' && input.t2 == 'relation' ", 
                       selectInput(inputId = "var4" , label ="Select the Y variable" , choices = c1, selected = "Assault")),
      
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
                                       tags$p("This data set comes along with base R and contains statistics, 
                                              in arrests per 100,000 residents for assault, murder, and rape 
                                              in each of the 50 US states in 1973. Also, given is the percent 
                                              of the population living in urban areas.")
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
                     tabPanel("Crime Trends By State", value="trends", 
                              fluidRow(tags$div(align="center", box(tableOutput("top5"), 
                                                                    title = textOutput("head1") , 
                                                                    collapsible = TRUE, 
                                                                    status = "primary",  
                                                                    collapsed = TRUE, 
                                                                    solidHeader = TRUE)),
                                       tags$div(align="center", box(tableOutput("low5"), 
                                                                    title = textOutput("head2") , 
                                                                    collapsible = TRUE, 
                                                                    status = "primary",  
                                                                    collapsed = TRUE, 
                                                                    solidHeader = TRUE))
                              ),  withSpinner(plotlyOutput("bar"))),
                     tabPanel("Distribution", value="distro", plotlyOutput("histplot")),
                     tabPanel("Correlation Matrix", plotlyOutput("cor")),
                     tabPanel("Arrest types and Urban Population", 
                              radioButtons(inputId ="fit", 
                                           label = "Select smooth method", 
                                           choices = c("loess", "lm"), 
                                           selected = "lm", 
                                           inline = TRUE), 
                              value="relation", withSpinner(plotlyOutput("scatter")))
              )
      ),
      #third tab item
      tabItem(tabName = "map",
              box(selectInput("crimetype", 
                              "Select Arrest Type", 
                              choices = c2, 
                              selected="Rape", 
                              width = 250),
                 withSpinner(plotOutput("map_plot")), width = 12)
      )
    )
  )
)