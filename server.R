library(shiny)
library(ggdirections) 

shinyServer(function(input, output) {
    dataInput <- reactive({
        
    })
    output$map <- renderPlot({
        avoid <- switch(input$avoid, 
                        "None"= NULL,
                        "Tolls"= "tolls",
                        "Highways" = "highways")
        mode <- switch(input$mode,
                       "Driving"="driving",
                       "Walking"="walking",
                       "Bicycling"="bicycling")
        
        directions(input$origin,input$dest,avoid,mode)
    })
})