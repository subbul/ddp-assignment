library(shiny)
library(rpart)
car_db <- read.csv("car.data")
colnames(car_db) <- c('buying','maint','doors','persons','lug_boot','safety','final_class')
fit <- rpart(final_class ~ ., data=car_db,method='class')
#printcp(build)
#plotcp(build)
#plot(build,uniform = TRUE,main="Classification tree for car buying",)
#text(build,use.n=TRUE)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
#    output$Text1 <- renderText({paste("<i>Buying Cost</i> : <b>",input$buying,"</b>","<i> Maintenance Cost </i>: <b>",input$maint,"</b>",
#                                      "<i>No of Doors</i>: <b>",input$doors,"</b>","<i> No of Persons </i>: <b>",input$persons,"</b>",
#                                      "<i>Size of Luggage/Boot</i>: <b>",input$lug_boot,"</b>","<i> Safety Requirement</i>: <b>",
#                                      input$safety,"</b>"
#                                      )})
    
    test <- reactive({data.frame('buying'=input$buying,'maint'=input$maint,'doors'=input$doors,
                    'persons'=input$persons,'lug_boot'=input$lug_boot,'safety'=input$safety,'final_class'="")
    })
    
    output$Text1<- renderDataTable({test()},options=list(paging=FALSE,searching=FALSE))
    prediction_output <- reactive({predict(fit,newdata=test(),type=c("class"))})
    output$Text2 <- renderText({paste("<br><b>Predicted output is:</b><span style=\"color: #e05921;
    font-weight: bold;font-size:large\">",prediction_output(),"</span></br>")})
    
    

})