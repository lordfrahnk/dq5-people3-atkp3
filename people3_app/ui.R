
# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    theme = shinytheme('united'),

    # Application title
    titlePanel('People3'),
    sidebarLayout(
        sidebarPanel(
            selectInput('metro_area',
                        'Select the metro area',
                        choices = unique(education$metro_area)),
            fileInput(
                'file',
                'Upload your file',
                accept = c('.xlsx'))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(
                tabPanel('Race',
                         plotOutput('race'),
                         plotOutput('file_race')),
                tabPanel('Sex by Age',
                         plotOutput('sex_by_age'),
                         plotOutput('file_sex_by_age')),
                tabPanel('Education',
                         plotOutput('education_level'),
                         plotOutput('file_education_level'))
            )
        )
    )
))
