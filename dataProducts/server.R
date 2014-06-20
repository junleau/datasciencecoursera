#This is the server code for the data product project

library(shiny)

drawHist <- function (size){
size
 hist(rpois(size,75))
}
shinyServer(
function(input, output) {
 output$sampleHist = renderPlot(drawHist(as.numeric(input$samplesize)))
 output$osamplesize = renderPrint({input$samplesize})
 output$otask = renderPrint({input$task})
 output$oalpha = renderPrint({input$alpha})

 output$omu0 = renderPrint({input$mu0})
}
)