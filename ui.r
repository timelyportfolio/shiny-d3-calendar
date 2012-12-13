#R and Shiny adaptation of http://bl.ocks.org/4063318

reactiveSvg <- function (outputId) 
{
  HTML(paste("<div id=\"", outputId, "\" class=\"shiny-network-output\"><svg /></div>", sep=""))
}


shinyUI(pageWithSidebar(
  headerPanel(title=HTML("Shiny and R adaptation of <a href = \"http://bl.ocks.org/4063318\">Mike Bostock's d3 Calendar</a>")),
  sidebarPanel(selectInput(inputId = "indexTicker",
                    label = "Index to Plot (source Yahoo! Finance):",
                    choices = c("GSPC", "GDAXI", "N225", "KS11")),
               helpText(HTML("All source available on <a href = \"https://github.com/timelyportfolio/shiny-d3-calendar\">Github</a>"))
              ),
               
  mainPanel(
    includeHTML("d3calendar.js"),
    reactiveSvg(outputId = "calendarplot")
  )
  
  )
  
)