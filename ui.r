library(shiny)
library(datasets)

data(mtcars)
CarList <- row.names(mtcars)


shinyUI(
    pageWithSidebar(
        ##Applcation title
        headerPanel("Car MPG Benchmarking"),
        sidebarPanel(
            h3("Configuration", align = "center"),
            br(),
            p("Choose a car two cars at the lists below and click at the Update button to compare MPG consumption"),
            selectInput("Car1", label = "Car 1:", choices = CarList, selected = 1),
            selectInput("Car2", label = "Car 2:", choices = CarList, selected = 3),
            actionButton("Update", "Update", icon("refresh"))
            ),
        mainPanel(
            tabsetPanel(
                tabPanel("Guide", verbatimTextOutput("Guide_Text")),
                tabPanel("MPG Benchmarking", plotOutput("CarPlot"))
                )
            )
        )
)