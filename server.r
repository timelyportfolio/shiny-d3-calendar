#enter any requires/library here
require(quantmod)
#require(PerformanceAnalytics)

shinyServer(function(input, output) {
  #use the structure from trestletechnology example to load data
  data <- reactive(function(){
    getSymbols(paste("^",input$indexTicker,sep=""))
    #combine date from xts and coredata to get a data.frame in the format best for JSON pass in Shiny
    data <- cbind(format(index(get(input$indexTicker)),"%Y-%m-%d"),coredata(get(input$indexTicker)))
    #name columns same as the example
    colnames(data) <- c("Date","Open","High","Low","Close","Volume","Adj Close")
    data
  })
  
  output$calendarplot <- reactive(function() { data() })
})