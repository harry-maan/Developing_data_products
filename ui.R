library(shiny)

# Load the 'datasets' package which contains 'VADeaths' dataset
library(datasets)

# Define the overall UI
shinyUI(
    
    # Use a fluid Bootstrap layout
    fluidPage(    
        
        # Give the page a title
        titlePanel("Death Rate Analysis in Virginia (Year 1940) by Population Group"),
        
        # Generate a row with a sidebar
        sidebarLayout(      
            
            # Define the sidebar with input to select the population group
            sidebarPanel(
                selectInput("population_group", "Population Group:", choices=colnames(VADeaths)),
                hr(),
                helpText("This shiny app shows Death Rates in Virginia in 1940 by age group on the selected population group."),
                hr(),
                helpText("Source code can be found at https://github.com/anvd/Coursera-Developing_Data_Products")
            ),
            
            # Create a spot for the barplot
            mainPanel(
                plotOutput("deathPlot"),
                h3('Total Death of the population group'),
                verbatimTextOutput("prediction")
            )
            
        )
    )
)
