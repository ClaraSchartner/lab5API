library(shiny)

shinyUI(fluidPage(
    titlePanel("Find the routes to your destination!"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Choose the place you want to go."),
            
            textInput("origin", label=h3("Origin"), value="Type a country or city..."),
            textInput("dest", label=h3("Destination"), value="Type a country or city...")
        ),
        mainPanel(
            #textOutput("text1"),
            #textOutput("text2"),
            h3("Let's Go!!!"),
            plotOutput("map")
        )
    )
))
