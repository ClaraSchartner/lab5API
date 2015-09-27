library(shiny)
library(maps)

shinyUI(fluidPage(
    titlePanel("Find the routes to your desire destination!"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("It's time to choose the place you want to go to."),
            
            textInput("origin", label=h4("Origin"), value="Linköping"),
            textInput("dest", label=h4("Destination"), value="Stockholm"),
            radioButtons("avoid", label=h4("Avoid"), choices=list("None","Tolls","Highways","Ferries")),
            selectInput("mode", label=h4("Travel Mode"), choices=list("Driving","Walking","Bicycling"),selected="Driving")
            #br(),
            #submitButton("Go"),
            #actionButton("goButton", label="Go")
        ),
        mainPanel(
            h3("Be patient....1...2.....3..Let's Go!!!"),
            plotOutput("map")
        )
    )
))
