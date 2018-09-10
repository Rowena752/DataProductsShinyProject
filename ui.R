#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plyr)
library(dplyr)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  #Title for the app
  titlePanel("Survival on the Titanic"),
  #Input Design
  sidebarLayout(
    sidebarPanel(
      #Information about the input and what it will produce
      h3("Select the input here to produce a plot showing survival numbers of Titanic passengers according to selected criteria"),
      selectInput("Class", "Class of passenger", 
                  choices = c("1st", "2nd", "3rd", "Crew"),
                  selected = "1st"),
      selectInput("Sex", "Sex of passenger", 
                  choices = c("Male", "Female"),
                  selected = "Male"),
      selectInput("Age", "Age of passenger", 
                  choices = c("Child", "Adult"),
                  selected = "Child")
    ),
    #What the main panel will contain (the output)
    mainPanel(
      plotOutput("FreqSurvivalPlot")
    )
  )
)
)