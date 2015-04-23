library(shiny)
library(datasets)

data(mtcars)

shinyServer(
    function(input, output){
        output$CarPlot <- renderPlot({
            ##Avoid plot on first time the page is load
            if (input$Update == 0)
                return()

            isolate({
                ##Store MPG value for the selected cars
                MPG <- data.frame(car = c(input$Car1, input$Car2), mpg = c(mtcars[input$Car1, 1], mtcars[input$Car2, 1]))
                barplot(MPG[, 2], names.arg = MPG[, 1])
            })
        })
        output$Guide_Text <- renderText("Select two diferents cars to compare there consumption of miles per galons and click on Update button to see the barplot in MPG Benchmarking tab")
    }
)