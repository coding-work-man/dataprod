library(shiny)
data(mtcars)
shinyUI(pageWithSidebar(
  headerPanel("Miles Per Gallon Estimation"),
  
  sidebarPanel(  
    selectInput('am','Transimisson Type',c('Auto','Manual')),
    numericInput("wt", "Weight of your car(ton)", 2),
    numericInput("qsec", "1/4 miles time", 16)
    
  ),
  mainPanel(
    #textOutput('text1')
    h1("Prediction For MPG"),
    h2("How to"),    
    p("This is a simple application to predict the miles per gallon for your automobile based on it's trainsimission type,weight(in ton), and 1/4 miles time.Just select the transimission type and input your automobile's weight and 1/4 miles time in the left panel, you will get a prediction for you automobile.Enjoy it!"),
    h2("Prediction Plot"),
    plotOutput('plot')
    
  )
))