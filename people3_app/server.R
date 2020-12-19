
# Define server logic
shinyServer(function(input, output) {

        upload_race <- reactive({req(input$file)
            read_excel(input$file$datapath, sheet = 1)})
        
        upload_sex_by_age <- reactive({req(input$file)
            read_excel(input$file$datapath, sheet = 2)})
        
        upload_education <- reactive({req(input$file)
            read_excel(input$file$datapath, sheet = 3)})
    
    output$race <- renderPlot({
        race %>% 
            filter(metro_area == input$metro_area, race != 'Total') %>% 
            mutate(percent = round(estimate / sum(estimate)*100), digits = 5) %>%
            ggplot(aes(x = reorder(race, percent), y = percent)) +
            geom_text(aes(label = percent, hjust = -.50)) +
            labs(title = input$metro_area, x = 'Race', y = 'Percent of Population') +
            ylim(0, 100) +
            geom_col(fill = 'orange') +
            coord_flip()
    })    
        
    output$file_race <- renderPlot({
        upload_race() %>% 
            mutate(Percent = round(Count / sum(Count)*100)) %>% 
            ggplot(aes(x = reorder(Race, Percent), y = Percent)) +
            geom_col(fill = 'orange') +
            geom_text(aes(label = Percent, hjust = -.50)) +
            labs(title = 'Company of Interest', x = 'Race', y = 'Percent of Population') +
            ylim(0, 100) +
            coord_flip()
    })
    
    
    output$file_sex_by_age <- renderPlot({
        upload_sex_by_age() %>% 
            group_by(Sex) %>% 
            mutate(percent = round(Count/sum(Count)*100, digits = 2)) %>% 
            ggplot(aes(x = reorder(Age, percent), y = percent, fill = Sex)) + 
            geom_col() +
            ylim(0, 100) +
            labs(title = 'Company of Interest', x = 'Age', y = 'Percent of Population')
    })
    
    output$sex_by_age <- renderPlot({
        sex_by_age %>% 
            filter(metro_area == input$metro_area) %>% 
            group_by(sex) %>% 
            mutate(percent = round(estimate / sum(estimate)*100), digits = 5) %>%
            ggplot(aes(x = reorder(age, percent), y = percent, fill = sex)) +
            geom_col() +
            ylim(0, 100) +
            labs(title = input$metro_area, x = 'Age', y = 'Percent of Population')
    })
    
    output$file_education_level <- renderPlot({
        upload_education() %>% 
            mutate(Percent = round(Count / sum(Count)*100)) %>% 
            ggplot(aes(x = reorder(Education, Percent), y = Percent)) +
            geom_col(fill = 'orange') +
            geom_text(aes(label = Percent, hjust = -.50)) +
            labs(title = 'Company of Interest', x = 'Education Level', y = 'Percent of Population') +
            ylim(0, 100) +
            coord_flip()
    })
    
    output$education_level <- renderPlot({
        education %>% 
            filter(metro_area == input$metro_area, education != 'Total') %>%
            mutate(percent = round(estimate / sum(estimate)*100), digits = 5) %>%
            ggplot(aes(x = reorder(education, percent), y= percent)) +
            geom_col(fill = 'orange') +
            geom_text(aes(label = percent, hjust = -.50)) +
            labs(title = input$metro_area, x = 'Education Level', y = 'Percent of Population') +
            ylim(0, 100) +
            coord_flip()
    })

})
