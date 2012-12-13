#R and Shiny adaptation of http://bl.ocks.org/4063318

reactiveSvg <- function (outputId) 
{
  HTML(paste("<div id=\"", outputId, "\" class=\"shiny-network-output\"><svg /></div>", sep=""))
}


shinyUI(pageWithSidebar(
  headerPanel(title="Shiny and R adaptation of Mike Bostock's calendar"),
  sidebarPanel(selectInput(inputId = "indexTicker",
              label = "Index to Plot (source Yahoo! Finance):",
              choices = c("GSPC", "GDAXI", "N225", "KS11")) ),
  mainPanel(
    includeHTML("d3calendar.js"),
    reactiveSvg(outputId = "calendarplot")
  )
  
  )
  
)