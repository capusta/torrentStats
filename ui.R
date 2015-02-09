library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Kickass .... "),

 sidebarLayout(
   sidebarPanel(
     p("so we decided to see what kind of torrents are uploaded on kickass ..."),
     sliderInput("colors", label = h3("wow, many colors"), min = 9,
                 max = 15, value = 9)
     ),
   mainPanel(  plotOutput("distPlot") )
   )
)
)