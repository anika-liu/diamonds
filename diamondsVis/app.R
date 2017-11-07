library(shiny)
#shinyapp
library(shiny)
library(ggplot2)
# Input manually
# GUI 
ui <- fluidPage(
  titlePanel("Diamonds Data"),
#  h1("I am header 1"),
#  h2("I am header 2"),
  sidebarLayout(
    sidebarPanel(
      helpText("This app is to visualize diamonds dataset"),
      textInput(inputId = "title", # "title": the r variable
                label = "Chart title", 
                value = ""),
      selectInput(inputId = "pos",
                  label = "Position",
                  choices = list("stack","dodge"),
                  selected = "stack")
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)

# Server
server <- function(input, output){
  output$plot = renderPlot({
    ggplot(diamonds, aes(x = cut, fill = clarity)) + 
      geom_bar(position = input$pos)+
      ggtitle(input$title)
  })
}

# Run the App
shinyApp(ui, server)

# runApp("diamondsVis")


