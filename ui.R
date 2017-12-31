#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Chick Weight based on the type of weight and Number of days"),
  
  # Sidebar with a slider input for number of days and diet 
  sidebarLayout(
    sidebarPanel(
       sliderInput("days",
                   "Number of Days:",
                   min = 1,
                   max = 21,
                   value = 10),
       sliderInput("diet",
                   "Type of Diet:",
                   min = 1,
                   max = 4,
                   value = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("ChkWtPlot"),
       h3("Predicted Chick Weight is:"),
       textOutput("ChickWt")

    )
  )
))
