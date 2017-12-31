#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
library(lattice)


shinyServer(function(input, output) {
   
  data(ChickWeight)
    
    trainedModel <- lm(weight~Time, data=ChickWeight)

    predictWt <- reactive({
        

        myEntry <- data.frame(Time = input$days, Diet = input$diet)
        prediction <- predict(trainedModel, newdata = myEntry)
        
        return(prediction)
    })
    
  output$ChkWtPlot <- renderPlot({
    


      plot(ChickWeight$weight, ChickWeight$Time, xlab = "No. of Days", ylab = "Chick Weight", pch = 16, xlim = c(1, 21), ylim = c(10, 400))
      
      abline(trainedModel, col = "blue", lwd = 2)
      
      points(input$days, predictWt(), col = "red", pch = 16, cex = 2)

  })
  
   output$ChickWt <- renderText({
       
       predictWt()
   })
   
   
  
})
