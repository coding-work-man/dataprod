library(shiny)

shinyServer(function(input, output) {
  output$plot <- renderPlot(function() {  
    am=input$am
    if(am=='Auto')
      am=0
    else
      am=1
    qsec=input$qsec
    wt=input$wt
    data(mtcars)
    fit=lm(mpg~am+wt+qsec,data=mtcars)
    newdata=data.frame(am=am,wt=wt,qsec=qsec)
    miles=predict(fit,newdata=newdata)
    hist(mtcars$mpg,breaks=10,xlab="Miles Per Gallon",ylab="Frequency",
         main="Prediction For MPG")
    abline(v=miles,col="red",lwd=2)
    miles.txt=as.character(miles)
    miles.txt=paste("Your MPG:",substr(miles.txt,1,5))
    text(miles,7,miles.txt)
  }, height=500)  
})