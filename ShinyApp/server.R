# server.R

library(shiny)
library(quantmod)


shinyServer(function(input, output) {
  symbol <- reactive ({ if ( input$symb==1) {'^IXIC'} else {'DJIA'} })
  NYSEidx <- reactive ({ if ( input$symb==1) {'NASDAQ Composite'} else {'Dow Jones Industrial Average'} })
  dataInput <- reactive({
    getSymbols(symbol(), src = "yahoo", 
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  
  output$plot <- renderPlot({   
        chartSeries(dataInput(), theme = chartTheme("white"),type = "line", TA = NULL, show.grid=T,name=(paste(NYSEidx(),'(',symbol(),") Variation",sep=" ")))
  })
})
