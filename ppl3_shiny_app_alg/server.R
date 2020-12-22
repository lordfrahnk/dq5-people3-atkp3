
# This is the server logic of a Shiny web application. Y

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$plot <- renderPlot({

        # draw the plot for education by metro area
        acs5_education %>% 
            filter(metropolitan_area == input$city) %>%  
            ggplot(aes(x=estimate, y= reorder(education, estimate))) +
            geom_col(color = 'black') +
            scale_x_continuous(labels = comma) +
            labs(x="2018 ACS estimate",
                 y="",
                 title = 'Education Attainment by Metro Area')

    })
    
    output$table <- DT::renderDT({
        acs5_education %>% 
            filter(metropolitan_area == input$city)
    })

})
