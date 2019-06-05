####################################
#### Google Analytics - server.R ###
####################################

library("shiny")
library("plyr")
library("ggplot2")


setwd("/Users/harshsamani/Desktop/Masters/Communication & Visualization/")
my_data <- load("House_Price_data.csv") # load the dataframe
my_data[,1:81] <- data.frame(sapply(my_data[,1:81], function(x) as.numeric(x)))
my_data <- subset(my_data, select = -c(7))

View(my_data)
names(my_data) <- tolower(names(my_data))

shinyServer(function(input, output) { # server is defined within these parentheses
  
  # prep data once and then pass around the program
  
  output$hourGraph <- renderPlot({
    
    graphData <- aggregate(data = passData(),
                           cbind(visitors, visits, bounces, timeonsite, hour)~domain+date
                           , FUN=sum)
    
    if(input$outputType == "visitors"){
      
      theGraph <- ggplot(graphData, aes(x = hour, y = visitors, group = domain, colour = domain)) + geom_line() +
        ylab("Unique visitors")
      
    }
    
    if(input$outputType == "bounceRate"){
      
      theGraph <- ggplot(graphData, aes(x = hour, y = bounces / visits * 100, group = domain, colour = domain)) +
        geom_line() + ylab("Bounce rate %")
      
    }
    
    if(input$outputType == "timeOnSite"){
      
      theGraph <- ggplot(graphData, aes(x = hour, y = timeonsite / visits, group = domain, colour = domain)) +
        geom_line() + ylab("Average time on site")
      
    }
    
    if(input$smoother){
      
      theGraph <- theGraph + geom_smooth()
      
    }
    
    print(theGraph)
    
  })
  
  
  output$outTable <- renderTable({ 
    
    table(analytics[analytics[,"networkdomain"] == input$network,"hour"]
    )
    
  })
  
  
  output$textDisplay <- renderText({ 
    
    paste(
      length(seq.Date(input$dateRange[1], input$dateRange[2], by = "days")),
      " days are summarised. There were", sum(passData()$visitors), "visitors in this time period."
    )
    
  })
})



View(my_data)

library(ggplot2)


ggplot(my_data, aes(x = Neighborhood , y = SalePrice)) + geom_histogram(stat = "identity")
