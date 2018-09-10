#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plyr)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$FreqSurvivalPlot <- renderPlot({
    #filter the data based on input
    Titanic_df <- adply(Titanic, c(1,2,3))
    data_filtered <- filter(Titanic_df, grepl(input$Class, Class), 
                            grepl(input$Sex, Sex), grepl(input$Age, Age))
    #data3 <- data2[data2[,"Age"] = input$Class,]
    #to be plotted
    to_plot <- data.frame("Survived" = c("No", "Yes"), "Freq" = c(data_filtered[,4], data_filtered[,5]))
    #draw the plot
    Survived <- c("no", "yes")
    plot <- ggplot(data=to_plot, aes(x = Survived, y = Freq, fill=Survived)) +
      geom_col() + theme_classic()
    plot
  })
})
