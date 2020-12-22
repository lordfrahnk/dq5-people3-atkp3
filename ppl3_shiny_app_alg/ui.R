
# This is the user-interface definition of a Shiny web application.

# Define UI for application that draws a histogram
shinyUI(fluidPage(


    # Application title
    titlePanel("People3"),
    theme = shinythemes::shinytheme("cerulean"),
    #theme = shinythemes::shinytheme("superhero"),
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("city", 
                        "Choose a city:",
                        choices = metro_choices
                        )
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(
                tabPanel("Plot", plotOutput("plot")),
                tabPanel("Table", DT::DTOutput("table"))
            )
           
        )
    )
))
