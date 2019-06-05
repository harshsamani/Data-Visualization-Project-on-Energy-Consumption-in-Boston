#### HARSH SAMANI #####
#### ABHISHEK NILAJAGI ####

library(shiny)
library(shinydashboard)
library (ggplot2)
library(shinydashboardPlus)
setwd("/Users/harshsamani/Desktop/Masters/Communication & Visualization/Week 4")
my_data <- read.csv("House_Price_data.csv") # load the dataframe
my_data <- subset(my_data, select = -c(1))
my_data$MSZoning

dashboardPage(
  dashboardHeader(title = "My Dashboard"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    (fluidPage(
      
      fluidRow(
      titlePanel(title = "Ames Hosuing"),
      sidebarLayout(
        sidebarPanel(
          selectInput("MSZoning", "Housing Zones:", 
                      c("Residential Medium Density" = "RM", 
                        "Residential Low Density" = "RL", 
                        "Residential High Density" = "RH",
                        "Floating Village Residential" = "FV",
                        "Commercial" = "C (all)")),
          hr()
        ),
        mainPanel(
          tabsetPanel(  
            
            tabPanel("Yearly figures of Housing Zones",plotOutput("salesPLot")),
            tabPanel("Amt of Area vs Zones", plotOutput("salesPLot1")),
            tabPanel("Total Surface Area vs Sale Price", plotOutput("salesPLot2")),
            tabPanel("Sale Price of Overall Condition", plotOutput("salesPLot3"))
          )
        )
        )
      )
      )
     )
  )
  
)

