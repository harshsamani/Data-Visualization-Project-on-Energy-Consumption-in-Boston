#### HARSH SAMANI #####
#### ABHISHEK NILAJAGI ####


library("shiny")
library("ggplot2")
library("shinydashboard")


RM_data <- my_data[my_data$MSZoning == 'RM',]
RM_data <- aggregate.data.frame(RM_data$SalePrice, by=list(RM_data$YrSold, RM_data$MSZoning), FUN = "mean")

RL_data <- my_data[my_data$MSZoning == 'RL',]
RL_data <- aggregate.data.frame(RL_data$SalePrice, by=list(RL_data$YrSold, RL_data$MSZoning), FUN = "mean")
# 
RH_data <- my_data[my_data$MSZoning == 'RH',]
RH_data <- aggregate.data.frame(RH_data$SalePrice, by=list(RH_data$YrSold, RH_data$MSZoning), FUN = "mean")
RH_data
# 
FV_data <- my_data[my_data$MSZoning == 'FV',]
FV_data <- aggregate.data.frame(FV_data$SalePrice, by=list(FV_data$YrSold, FV_data$MSZoning), FUN = "mean")
# 
C_data <- my_data[my_data$MSZoning == 'C (all)',]
C_data <- aggregate.data.frame(C_data$SalePrice, by=list(C_data$YrSold, C_data$MSZoning), FUN = "mean")

up_data <- rbind(RM_data, RL_data, RH_data, FV_data, C_data)
colnames(up_data) <- c("Year", "Zones", "Sale Price")


shinyServer(
function(input, output) {
  rec_data <- reactive({
    
    if(input$MSZoning == "RM"){
      data_display <- up_data[up_data$Zones == input$MSZoning,]
    }
    else if(input$MSZoning == "RL"){
      data_display <- up_data[up_data$Zones == input$MSZoning,]
    }
    
    else if(input$MSZoning == "RH"){
      data_display <- up_data[up_data$Zones == input$MSZoning,]
    }
    else if(input$MSZoning == "FV"){
      data_display <- up_data[up_data$Zones == input$MSZoning,]
    }
    
    else if(input$MSZoning == "C (all)"){
      data_display <- up_data[up_data$Zones == input$MSZoning,]
    }
  
  })
  output$salesPLot <- renderPlot({
    
    ggplot(rec_data(), aes(x = Year, y = `Sale Price`,shape=Zones, color=Zones)) + geom_point(color = "black") + geom_smooth()
})
  output$salesPLot1 <- renderPlot({
    
    ggplot(my_data, aes(x = MSZoning, y = LotArea)) + geom_histogram(stat = "identity", fill = "lightblue")
    })
  output$salesPLot2 <- renderPlot({
    
    ggplot(my_data, aes(x = TotalBsmtSF, y = SalePrice)) + geom_point() + geom_smooth()
  })
  output$salesPLot3 <- renderPlot({
    
    ggplot(my_data, aes(x = OverallCond, y = SalePrice)) + geom_histogram(stat = "identity",fill = "orange") 
    
  })
})



