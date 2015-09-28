library(shiny)
library(ggdirections) 

shinyServer(function(input, output) {
    output$map <- renderPlot({
        avoid <- switch(input$avoid, 
                        "None"= NULL,
                        "Tolls"= "tolls",
                        "Highways" = "highways",
                        "Ferries" = "ferries")
        mode <- switch(input$mode,
                       "Driving"="driving",
                       "Walking"="walking",
                       "Bicycling"="bicycling")
        o <- input$origin
        d <- input$dest
        if(!(exists("o") & exists("d"))){
            stop("Please complete")
        }else{
            directions(o,d,avoid,mode)}
    })
})