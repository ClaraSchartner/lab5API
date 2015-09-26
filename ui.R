library(shiny)

shinyUI(fluidPage(
    titlePanel("Find the routes to your desire destination!"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("It's time to choose the place you want to go."),
            
            textInput("origin", label=h4("Origin"), value="Type a country or city..."),
            textInput("dest", label=h4("Destination"), value="Type a country or city..."),
            radioButtons("avoid", label=h4("Avoid"), choices=list("None","Tolls","Highways")),
            selectInput("mode", label=h4("Travel Mode"), choices=list("Driving","Walking","Bicycling"),selected="Driving")
        ),
        mainPanel(
            h3("Be patient....1..2.....3..Let's Go!!!"),
            plotOutput("map")
        )
    )
))
