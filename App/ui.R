library(shiny)

shinyUI(fluidPage(
    titlePanel("Find the routes to your destination!"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Choose the place you want to go to."),
            
            textInput("origin", label=h3("Origin"), value="Type in a city..."),
            textInput("dest", label=h3("Destination"), value="Type in a city...")
        ),
        mainPanel(
            #textOutput("text1"),
            #textOutput("text2"),
            h3("Let's Go!!!"),
            plotOutput("map")
        )
    )
))
