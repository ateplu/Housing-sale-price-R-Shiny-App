# This App predicts Texas housing sales based on the data set 'txhousing'
# collected in 2000-2015 per months and per city.

library(shiny)
library(ggplot2)

# Load data
data("txhousing")

shinyUI(fluidPage(
  titlePanel("Predict Texas housing median sale price per year"),
  sidebarLayout(
    sidebarPanel(
      selectInput("city", "City", (sort(unique(txhousing$city)))),
      sliderInput("sliderMonth", "Select month", min=1, max=12, value = 5, step=1),
      sliderInput("sliderYear", "Select year", min=2000, max=2022, value = 2005, step=1),
      checkboxInput("showModel1", "Show/Hide ModelFit", value = TRUE),
      submitButton("Submit")
    ),
    mainPanel(
      h3("This Shiny App is dedicated to predicting housing median 
         sale prices (MSP) in multiple Texas cities. To get a certain MSP,
         a user should specify a city, a month and a year."),
      h4("To build a predicitve linear model the data set `txhousing` collected
         in 2000-2015 is used. Data points are fitted as `median` vs `year` for selected
         `city` and `month`."),
      plotOutput("plot1"),
      h3("City:", textOutput("city1", inline=TRUE)),
      h3("Month:", textOutput("month1", inline=TRUE)),
      h3("Year:", textOutput("year1", inline=TRUE)),
      h3("Predicted median sale price [10^3 $]:", textOutput("pred1", inline=TRUE))
    )
  )
))
