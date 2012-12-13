#enter any requires/library here
require(quantmod)
#require(PerformanceAnalytics)

shinyServer(function(input, output) {
  #use the structure from trestletechnology example to load data
  data <- reactive(function(){
    getSymbols(paste("^",input$indexTicker,sep=""))
    data <- cbind(format(index(get(input$indexTicker)),"%Y-%m-%d"),coredata(get(input$indexTicker)))
    colnames(data) <- c("Date","Open","High","Low","Close","Volume","Adj Close")
    data
  })
  
  output$calendarplot <- reactive(function() { data() })
})