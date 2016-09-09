shinyUI(fluidPage(
    titlePanel("Car Selection Prediction"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Critical - Car selection parameters"),
            selectInput("safety", 
                         label = "Choose safety requirement of  Car",
                         choices = list("Low"="low","Medium"='med','High'='high'),selected='high'
                         ),                  
            
            selectInput("buying", 
                        label = "Choose Buying cost range ",
                        choices = list("Very High"="vhigh","High"="high","Medium"="med","Low"="low"),
                        selected='low'),
            selectInput("maint", 
                        label = "Choose Maintenance cost range ",
                        choices = list("Very High"="vhigh","High"='high',"Medium"='med',"Low"='low'),
                         selected="low"),
             selectInput("doors", 
                         label = "Choose # of Doors in Car",
                         choices = list("2"="2","3"='3',"4"='4','5More'='5more'),selected='5more'
                         ),
             selectInput("persons", 
                         label = "Choose # of Passengers in Car",
                         choices = list("2"="2","4"='4',"More"='more'),selected="more"
                         ),
             selectInput("lug_boot", 
                         label = "Choose volume of Luggage/Bootspace in Car",
                         choices = list("Small"="small","Medium"='med','Big'='big'),selected="big"
                         )
    
            ),
        
        mainPanel(
            br(),
            tabsetPanel(type = "tabs", 
                        tabPanel("Prediction/Output",  
                                    h3("Adjust the parameters to predict the final outcome of Car Selection"),
                                    helpText("Input from your Selection "),
                                    dataTableOutput("Text1"),
                                    htmlOutput("Text2",inline = TRUE),
                                    br(),
                                    br(),
                                    helpText("unacc-Not an Acceptable choice"),
                                    helpText("acc- Acceptable choice"),
                                    helpText("good - Good choice"),
                                    helpText("vgood - Very Good choice")
                                    ),
                        tabPanel("Help", 
                                    h3("Help about using this Application"),
                                    p("This Application is based on Car Evaluation data set available at"), 
                                        a("UCI Machine Learning Repo",href="http://archive.ics.uci.edu/ml/datasets/Car+Evaluation"),
                                    helpText("In this exercise we are predicting the category or car selection based on below parameters;"),
                                    div("Car Acceptability is the output class we are predicting from the Classification Algorithm"),
                                    div("Input to the classification models are:"),
                                    div("Buying Price (Low medium and High Range)"),
                                    div("Cost of Maintenance (Low Medium and High)"),
                                    div("No of doors in the car"),
                                    div("Person carrying capacity of the car"),
                                    div("Security aspects of the car in case of accident/catastrophy"),
                                    div("Leg room or Storage space of Car"),
                                    br(),
                                    p("Rpart classification algorithm is used to fit the input and generate a model, as the user enter/selects
                                      values by drop-down, the algorithm predicts the outcome",style="font-size:medium;color:blue")
                                 )
                )
#            htmlOutput("Text2",inline = TRUE),
        )
    )
))