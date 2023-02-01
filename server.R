# Load libraries
library(shiny)
library(ggplot2)


shinyServer(function(input, output) {
  
  # Load data
  data("txhousing")
  
  test_react<-reactive({
    subset(txhousing, month == input$sliderMonth &
             city == input$city)  
  })
  
  # Fitting model
  model1 <- reactive({
    sset <- test_react()
    lm(1.e-03*median ~ year, data = sset)
  })
  
  model1pred <- reactive({
    yearInput <- input$sliderYear
    predict(model1(), newdata = data.frame(year = yearInput))
  })
  
  # Make a plot
  output$plot1 <- renderPlot({
    # Load the data subset
    sset <- subset(txhousing, month == input$sliderMonth &
                     city == input$city)
    
    yearInput <- input$sliderYear
    
    plot(sset$year, 1.e-03*sset$median, xlab = "Year", 
         ylab = "Median sale price [10^3 $]", bty = "n", pch = 16,
         xlim = c(1999, 2025), ylim = c(20, 350))
    if(input$showModel1){
      abline(model1(), col = "blue", lwd = 2)
    }

    points(yearInput, model1pred(), col = "blue", pch = 16, cex = 2)
  })
  
  output$pred1 <- renderText({
    model1pred()
    })
  output$city1 <- renderText({
    input$city
  })
    output$month1 <- renderText({
    input$sliderMonth
  })
    output$year1 <- renderText({
      input$sliderYear
    })
  
})
