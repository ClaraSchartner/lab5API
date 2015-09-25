library(shiny)
library(ggplot2)
library(ggmap)
library(mapproj)
library(maps)
#library(##our package) 

shinyServer(function(input, output) {
    
    #output$text1 <- renderText({
    #    paste("You have selected ", input$origin, "to be your origin")
    #})
    
    #output$text2 <- renderText({
    #    paste("You have selected ", input$dest, "to be your destination")
    #})
    
    ##still can't test 'cause package isn't buit yet
    output$map <- renderPlot({
        geo_map(input$origin,input$dest)
    })
    
})