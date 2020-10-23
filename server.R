#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shiny)

library(datasets)

# PColor palette for the bar graph
colors = c("red", "green", "blue", "cyan", "magenta")

# Server side code to handle user's selection
shinyServer(function(input, output) {
    
    ##Total Number of Death for this population group
    output$prediction <- renderPrint({sum(VADeaths[,input$population_group]*1000)})
    
    # Fill in the spot we created for a plot
    output$deathPlot <- renderPlot({
        # Render a barplot
        barplot(VADeaths[,input$population_group], 
                main=input$population_group,
                ylab="Death Rate per 1000 population",
                xlab="Age Group",
                col=colors)
    })
})