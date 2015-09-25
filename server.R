library(shiny)
library(ggdirections) 

shinyServer(function(input, output) {
    output$map <- renderPlot({
        directions(input$origin,input$dest,input$avoid,input$mode)
    })
})