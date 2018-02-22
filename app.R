library(shiny)
library(shinydashboard)
library(plyr)         # Data manipulation
library(dplyr)        # Data manipulation
library(ggplot2)      # Data visualization
library(plotly)       # Dynamic data visualization
library(caTools)      # Setting seeds
library(rpart)        # Decision Trees
library(randomForest) # Random Forest
library(maps)         # World Map
library(countrycode)  # Gets country code 
library(leaflet)      # Interactive maps
library(corrplot)     # Nice correlation matrix
library(RColorBrewer) # Color brewer

source("C:/Users/smitha.shivakumar/Documents/R/HappinessQuotient/HappineesQuotient-script.R")

ui <- dashboardPage(
  dashboardHeader(title = "Happiness Quotient"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Brief Intro", tabName = NULL, icon = icon("info-circle"),
               menuSubItem("Intoduction", tabName = "intro", icon = icon("info-circle")),
               menuSubItem("Project Guidelines", tabName ="ProjectGuidelines", icon = icon("stack-overflow")),
               menuSubItem("Context", tabName = "Context", icon = icon("thermometer-full")),
               menuSubItem("Inspiration", tabName = "Inspiration", icon = icon("users"))
             #  menuSubItem("Family Satisfaction", tabName = "familySatisfaction", icon = icon("users"))
      ),
      menuItem("Dystopia", tabName = "dystopia", icon = icon("tint")),
      
      menuItem("Factors", tabName = NULL, icon = icon("bars"),
              menuSubItem("Economy by Regions", tabName = "economy", icon = icon("stack-overflow")),
              menuSubItem("Life Expectancy", tabName = "lifeExpectancy", icon = icon("thermometer-full")),
              menuSubItem("Trust Government Corruption", tabName = "corruption", icon = icon("sign-language")),
              menuSubItem("Family Satisfaction", tabName = "familySatisfaction", icon = icon("users"))
              ),
      menuItem("Comparisons", tabName = NULL, icon = icon("bars"),
             menuSubItem("Correlations", tabName = "correlations", icon = icon("lines")),   
             menuSubItem("GDP", tabName = "GDP", icon = icon("stack-overflow")),
             menuSubItem("Country Happiness Scores", tabName = "CtryHapScore", icon = icon("sign-language")),
             menuSubItem("Happiness Ratings in Regions", tabName = "ratingsinmap", icon = icon("dashboard")),
             menuSubItem("Economy vs Life Expectancy", tabName = "ecvsLifeEx", icon = icon("users"))
            ),
      menuItem("Conclusion", tabName = "Conclusions", icon = icon("hammer")),
      menuItem("References", tabName = "Bibliography", icon = icon("hammer"))
    )
  
  ),
  dashboardBody(
    # Boxes need to be put in a row (or column)
 tabItems( 

      tabItem(tabName = "intro",
              h2("512-90: Final Project Dashboard"),
              h4("The Happiness Quotient Dashboard is the final project submission by Smitha Shivakumar."),
              h4("This Dashboard talks about the World Happiness Quotient, which is a world survey data collected in 2015 to 2017."), 
              h4("It was one of the Data Science Challenges on Kaggle(https://www.kaggle.com/unsdsn/world-happiness)."),
              h4("This dataset has been taken to conduct various Visualizations to understand the Happiness Quotient in different parts of the country and conduct a comparative
                 analysis on the same."),
              h4("  

                "),
               h4("The Brief Intro tab comprises of the Project Guidelines as set by Prof.Alan Hitch, the Context of this data as given on Kaggle and 
                 finally the Inspiration to work on this particular dataset."),
              h4("  

                 "),
              h4("  The Dystopia tab talks about how we are setting the benchmark and what exactly it adds to the model. It is informative."),
              h4("  

                 "),
              h4("   The Factors tab conducts more of an Univariate Analysis with interactive Scatterplots, giving the user a general idea on what the
                 data represents."),
              h4("  

                 "),
              h4("   The Comparisons tabs have Bivariate Analysis which have World Maps and different violin graphs to give a better representation and 
                 understanding of the data."),
              h4("  

                 "),  

              h4("  

                 "),
              h4("   The Conclusion tab summaries all our findings with simple bar charts to show how the Happiness Scores have moved across the years."),
              h4("  

                 "),
              h4("    Finally the Reference tab, has all the various nooks and corners of the internet I surveyed to help me put this project together."),

              h4("  

                 "),
              h4("  Smitha")
              ),
      
      tabItem(tabName = "ProjectGuidelines",              
                title = "Project Guidelines",

                   
                h4("The project must meet certain key objectives:"),
                   
                    h4("1. You must provide an written summary of your data collection, analysis and visualization methods, 
                       including the why you chose your methods, and what tools you utilized."),
                    
                    h4("2. Your summary must outline 5 questions that can be evaluated using a data-driven approach. 
                       These questions should be more than just 'How many miles did I run', although a couple of your 
                       questions could be stated that way."),
                    
                   h4("3. You must collect, manage, and store the data necessary for this visualization."),
                    
                    h4("4. You must design and create an appropriate set of visualizations (try not to use just one type 
                       of visualization) within a dashboard/storyboard that provides insight into your specified questions,
                       with a minimum of 1 interactive graphical element.")),
      
      tabItem(tabName = "Context",
                title = "Context of the Happiness Quotient Project",
                h4("The World Happiness Report is a landmark survey of the state of global happiness. The 
                   first report was published in 2012, the second in 2013, the third in 2015, and the fourth 
                   in the 2016 Update. The World Happiness 2017, which ranks 155 countries by their happiness 
                   levels, was released at the United Nations at an event celebrating International Day of Happiness
                   on March 20th. The report continues to gain global recognition as governments, organizations and 
                   civil society increasingly use happiness indicators to inform their policy-making decisions. 
                   Leading experts across fields - economics, psychology, survey analysis, national statistics, 
                   health, public policy and more - describe how measurements of well-being can be used effectively 
                   to assess the progress of nations. The reports review the state of happiness in the world today 
                   and show how the new science of happiness explains personal and national variations in happiness.")
             ),
      tabItem(tabName = "Inspiration",
                title = "Inspiration",
                h4("This dataset has a big potential for Data Science Applications. I have used this data to answer the following 
                   questions and so many more:"), 
                  h4("1. What countries or regions rank the highest in overall happiness and each of the six factors contributing to happiness? "),
                  h4("2. How did country ranks or scores change between the 2015 and 2016 as well as the 2016 and 2017 reports? "),
                  h4("3. Did any country experience a significant increase or decrease in happiness?"),
                  h4("4. What are the correlations in the factors used to find the Happiness Scores?"),
                  h4("5. How does each of the factors impact Happiness all accross the world?")
                ),
 
     tabItem(tabName = "dystopia",
             
              title = "What is Dystopia?",
               h2("Dystopia"),
               h4("Dystopia is an imaginary country that has the world's least-happy people. The purpose in establishing Dystopia is to have a 
                  benchmark against which all countries can be favorably compared (no country performs more poorly than Dystopia) in terms of 
                  each of the six key variables, thus allowing each sub-bar to be of positive width. The lowest scores observed for the six key 
                  variables, therefore, characterize Dystopia. Since life would be very unpleasant in a country with the world's lowest incomes, 
                  lowest life expectancy, lowest generosity, most corruption, least freedom and least social support, it is referred to as 'Dystopia,
                  in contrast to Utopia."),
             
             h4("What are the residuals?"),
             h4("  

                "),  
             h4("The residuals, or unexplained components, differ for each country, reflecting the extent to which the six variables either over- 
             or under-explain average 2014-2016 life evaluations. These residuals have an average value of approximately zero over the whole 
             set of countries. Figure 2.2 shows the average residual for each country when the equation in Table 2.1 is applied to average 2014- 2016 
             data for the six variables in that country. We combine these residuals with the estimate for life evaluations in Dystopia so that the 
             combined bar will always have positive values. As can be seen in Figure 2.2, although some life evaluation residuals are quite large, 
             occasionally exceeding one point on the scale from 0 to 10, they are always much smaller than the calculated value in Dystopia, where
             the average life is rated at 1.85 on the 0 to 10 scale."),
             h4("  

                 "),    
                h4("What do the columns succeeding the Happiness Score(like Family, Generosity, etc.) describe?"),
             h4("  

                "),  
               h4("The following columns: GDP per Capita, Family, Life Expectancy, Freedom, Generosity, Trust Government Corruption 
                describe the extent to which these factors contribute in evaluating the happiness in each country. 
                The Dystopia Residual metric actually is the Dystopia Happiness Score(1.85) + the Residual value or the unexplained 
                value for each country as stated in the previous answer."),
                
              h4("If you add all these factors up, you get the happiness score so it might be un-reliable to model them to predict Happiness Scores.")
             

      ),
 
     tabItem(tabName = "ratingsinmap",
             h2("Ratings by Region"),
           
               box(tabsetPanel(
                 tabPanel("2015",plotlyOutput("boxplot1")),
                 tabPanel("2016",plotlyOutput("boxplot2")),
                 tabPanel("2017",plotlyOutput("boxplot3"))
               ), height = 500, width = 700),
               box(
                 title = "Happiness by Regions",
                 h4("Hover on the graph"),
                 height = 500, width = 700)
     ),
     
     tabItem(tabName = "economy",
             h2("Economy"),
             title = "Happiness vs Economies by Regions",
             box(tabsetPanel(
               tabPanel("2015",plotlyOutput("scatterplot1")),
               tabPanel("2016",plotlyOutput("scatterplot2")),
               tabPanel("2017",plotlyOutput("scatterplot3"))
             ), height = 500, width = 700),
             box(
               h4("Hover on the graph")
               , height = 500, width = 700)
     ),
     
     tabItem(tabName = "lifeExpectancy",
             title = "Happiness vs Life Expectancy by Regions",
             h2("Life Expectancy"),
             box(tabsetPanel(
               tabPanel("2015",plotlyOutput("LEscatterplot1")),
               tabPanel("2016",plotlyOutput("LEscatterplot2")),
               tabPanel("2017",plotlyOutput("LEscatterplot3"))
             ), height = 500, width = 700),
             box(
               h4("Hover on the graph")
               , height = 500, width = 700)
     ),
     
     tabItem(tabName = "corruption",
             title = "Happiness vs Corruption by Regions",
             h2("Corruption"),
             box(tabsetPanel(
               tabPanel("2015",plotlyOutput("GCRscatterplot1")),
               tabPanel("2016",plotlyOutput("GCRscatterplot2")),
               tabPanel("2017",plotlyOutput("GCRscatterplot3"))
             ), height = 500, width = 700),
             box(
               h4("Hover on the graph")
               , height = 500, width = 700)
     ),
     
     tabItem(tabName = "familySatisfaction",
             title = "Happiness vs Family Satisfaction by Regions",
             h2("Family Satisfaction"),
             box(tabsetPanel(
               tabPanel("2015",plotlyOutput("FSscatterplot1")),
               tabPanel("2016",plotlyOutput("FSscatterplot2")),
               tabPanel("2017",plotlyOutput("FSscatterplot3"))
             ), height = 500, width = 700),
             box(
               h4("Hover on the graph")
               , height = 500, width = 700)
     ),
     tabItem(tabName = "correlations",
             title = "Correlation Plot",
             box(tabsetPanel(
               tabPanel("2015",plotOutput("Corrplot1")),
               tabPanel("2016",plotOutput("Corrplot2")),
               tabPanel("2017",plotOutput("Corrplot3"))
             ), height = 500, width = 700)
             ),
     
     tabItem(tabName = "GDP",
             #  fluidRow(
             box(tabsetPanel(
               tabPanel("2015",plotOutput("GDPplot1")),
               tabPanel("2016",plotOutput("GDPplot2")),
               tabPanel("2017",plotOutput("GDPplot3"))
             ), height = 500, width = 600),
             box(
               title = "GDP Plot",
               h4("This Map Plot takes 3seconds to load.")
               , height = 500, width = 700)
             ),

     
     tabItem(tabName = "CtryHapScore",
             title = "Country Happiness Plot",
             box(tabsetPanel(
               tabPanel("2015",plotOutput("CtryHapplot1")),
               tabPanel("2016",plotOutput("CtryHapplot2")),
               tabPanel("2017",plotOutput("CtryHapplot3"))
             ), height = 600, width = 700)
             
               
             ),
     tabItem(tabName = "ecvsLifeEx",
             title = "Economy vs Life Expectation Plot",
             box(tabsetPanel(
               tabPanel("2015",plotOutput("ecvsLifeExplot1")),
               tabPanel("2016",plotOutput("ecvsLifeExplot2")),
               tabPanel("2017",plotOutput("ecvsLifeExplot3"))
             ), height = 500, width = 700)
             
     ),
     

     
     tabItem(tabName = "Conclusions",
             #  fluidRow(
               h2("Conclusion"),
               box(tabsetPanel(
               tabPanel("Top 10",plotOutput("Top10plot")),
               tabPanel("Bottom 10",plotOutput("Bottom10plot")),
               tabPanel("Country Happiness Scores 2015-16",plotOutput("Btw1516")),
               tabPanel("Country Happiness Scores 2016-17",plotOutput("Btw1617")),
               tabPanel("Regression",plotOutput("Regressionplot1"))
               ), height = 600, width = 700),
             box(
               title = "Conclusion",
               h4("From the analysis we see that the Happiness Quotient has been increasing over the years and the factors 
                  add upto the Happiness Score as seen in the Regression Plot. Overall, we have answered each of our 5 main 
                  questions and on the way found more realtions in the dataset.")
               , height = 500, width = 700)
               

     ),
     tabItem(tabName = "Bibliography",
             #  fluidRow(
             h2("References"),
             title = "Correlation Plot",
             h4("1. https://www.kaggle.com/devendray/distinguishing-wh-with-diff-clustering-algorithms"),
             h4("2. https://www.kaggle.com/unsdsn/world-happiness"),
             h4("3. https://www.kaggle.com/aswathi15/happiness-report"),
             h4("4. https://www.statmethods.net/stats/correlations.html")
             
     )   

   )
  ))


server <- function(input, output) {
  # get dataset
  ################################################################################################################
  #################### Happiness Score Correlation Plot ##########################################################
  
  output$Corrplot1 <- renderPlot({
    corrplot(happy.2015.cormatr,
           col=brewer.pal(n=8, name="RdYlBu"),
           p.mat = p.mat.2015, sig.level = 0.05, insig = "blank")  # hide insig corr, sig = 
  })
  
  output$Corrplot2 <- renderPlot({corrplot(happy.2016.cormatr,
           col=brewer.pal(n=8, name="RdYlBu"),
           p.mat = p.mat.2016, sig.level = 0.05, insig = "blank")  # hide insig corr, sig = 0.05
  })
  
  output$Corrplot3 <- renderPlot({corrplot(happy.2017.cormatr,
           col=brewer.pal(n=8, name="RdYlBu"),
           p.mat = p.mat.2017, sig.level = 0.05, insig = "blank")  # hide insig corr, sig = 0.05
  })
  
  

  

  
  ################################################################################################################
  #################### Happiness Score by Regions ################################################################
  
  output$boxplot1 <- renderPlotly({
     p <- plot_ly(happy.2015,x=~Region,
                      y=~Happiness.Score,
                      type="box",
                      boxpoints="all",
                      color=~Region)%>%
                layout(xaxis=list(showticklabels = FALSE),
                       yaxis=list(title="Happiness Score"),
                       legend=list(x = 100, y = 0.5),
                       margin=list(b = 100))
    p$elementId <- NULL
    p
  })
  
  output$boxplot2 <- renderPlotly({
     p <-  plot_ly(happy.2016,x=~Region,
                        y=~Happiness.Score,
                        type="box",
                        boxpoints="all",
                        color=~Region)%>%
                  layout(xaxis=list(showticklabels = FALSE),
                         yaxis=list(title="Happiness Score"),
                         legend=list(x = 100, y = 0.5),
                         margin=list(b = 100))
    p$elementId <- NULL
    p
  })
  
  output$boxplot3 <- renderPlotly({
     p <- plot_ly(happy.2017,x=~Region,
                        y=~Happiness.Score,
                        type="box",
                        boxpoints="all",
                        color=~Region)%>%
                  layout(xaxis=list(showticklabels = FALSE),
                         yaxis=list(title="Happiness Score"),
                         legend=list(x = 100, y = 0.5),
                         margin=list(b = 100))
    p$elementId <- NULL
    p
  })
  
  ################################################################################################################
  #################### Happiness vs Economy ##############################################################
  
  output$scatterplot1 <- renderPlotly({
    p <- plot_ly(data=happy.2015,x=~Happiness.Score,
            y=~Economy..GDP.per.Capita.,
            color=~Region,
            type="scatter", mode = "markers",
            marker = list(size = 15),
            # Hover text:
            text = ~paste("<b>Region:</b> ", Region, 
                          "<br><b>Country:</b> ", Country,
                          "<br><b>Happiness Score:</b>", Happiness.Score,
                          "<br><b>GDP per capita:</b>", Economy..GDP.per.Capita.)) %>%
      layout(xaxis=list(title="Happiness Score"),
             yaxis=list(title="GDP per Capita"))
    p$elementId <- NULL
    p
  })
  
  output$scatterplot2 <- renderPlotly({
    p <- plot_ly(data=happy.2016,x=~Happiness.Score,
            y=~Economy..GDP.per.Capita.,
            color=~Region,
            type="scatter", mode = "markers",
            marker = list(size = 15),
            # Hover text:
            text = ~paste("<b>Region:</b> ", Region, 
                          "<br><b>Country:</b> ", Country,
                          "<br><b>Happiness Score:</b>", Happiness.Score,
                          "<br><b>GDP per capita:</b>", Economy..GDP.per.Capita.)) %>%
      layout(xaxis=list(title="Happiness Score"),
             yaxis=list(title="GDP per Capita"))
    p$elementId <- NULL
    p
  })
  
  output$scatterplot3 <- renderPlotly({
    p <- plot_ly(data=happy.2017,x=~Happiness.Score,
            y=~Economy..GDP.per.Capita.,
            color=~Region,
            type="scatter", mode = "markers",
            marker = list(size = 15),
            # Hover text:
            text = ~paste("<b>Region:</b> ", Region, 
                          "<br><b>Country:</b> ", Country,
                          "<br><b>Happiness Score:</b>", Happiness.Score,
                          "<br><b>GDP per capita:</b>", Economy..GDP.per.Capita.)) %>%
      layout(xaxis=list(title="Happiness Score"),
             yaxis=list(title="GDP per Capita"))
    p$elementId <- NULL
    p
  })
  
  ################################################################################################################
  #################### Happiness vs Life Expectancy ##############################################################
  
  output$LEscatterplot1 <- renderPlotly({
      p <-    plot_ly(data=happy.2015,x=~Happiness.Score,
                                   y=~Health..Life.Expectancy.,
                                   color=~Region,
                                   type="scatter", mode = "markers",
                                   marker = list(size = 15),
                                   # Hover text:
                                   text = ~paste("<b>Region:</b> ", Region, 
                                                 "<br><b>Country:</b> ", Country,
                                                 "<br><b>Happiness Score:</b>", Happiness.Score,
                                                 "<br><b>Health Life Expectancy:</b>", Health..Life.Expectancy.)) %>%
    layout(xaxis=list(title="Happiness Score"),
           yaxis=list(title="Health life expectancy"))
    
    p$elementId <- NULL
    p  
  })
  
  output$LEscatterplot2 <- renderPlotly({
    p <-    plot_ly(data=happy.2016,x=~Happiness.Score,
                                   y=~Health..Life.Expectancy.,
                                   color=~Region,
                                   type="scatter", mode = "markers",
                                   marker = list(size = 15),
                                   # Hover text:
                                   text = ~paste("<b>Region:</b> ", Region, 
                                                 "<br><b>Country:</b> ", Country,
                                                 "<br><b>Happiness Score:</b>", Happiness.Score,
                                                 "<br><b>Health Life Expectancy:</b>", Health..Life.Expectancy.)) %>%
    layout(xaxis=list(title="Happiness Score"),
           yaxis=list(title="Health life expectancy"))

    p$elementId <- NULL
    p  
  })
    
  output$LEscatterplot3 <- renderPlotly({
    p <-    plot_ly(data=happy.2017,x=~Happiness.Score,
                                   y=~Health..Life.Expectancy.,
                                   color=~Region,
                                   type="scatter", mode = "markers",
                                   marker = list(size = 15),
                                   # Hover text:
                                   text = ~paste("<b>Region:</b> ", Region, 
                                                 "<br><b>Country:</b> ", Country,
                                                 "<br><b>Happiness Score:</b>", Happiness.Score,
                                                 "<br><b>Health Life Expectancy:</b>", Health..Life.Expectancy.)) %>%
    layout(xaxis=list(title="Happiness Score"),
           yaxis=list(title="Health life expectancy"))
    p$elementId <- NULL
    p  
  })

  ################################################################################################################
  #################### Happiness vs Government Corruption ########################################################
  
  output$GCRscatterplot1 <- renderPlotly({
    p <-    plot_ly(data=happy.2015,x=~Happiness.Score,
                    y=~Trust..Government.Corruption.,
                    color=~Region,
                    type="scatter", mode = "markers",
                    marker = list(size = 15),
                    # Hover text:
                    text = ~paste("<b>Region:</b> ", Region, 
                                  "<br><b>Country:</b> ", Country,
                                  "<br><b>Happiness Score:</b>", Happiness.Score,
                                  "<br><b>Trust government corruption:</b>", Trust..Government.Corruption.)) %>%
      layout(xaxis=list(title="Happiness Score"),
             yaxis=list(title="Trust government corruption"))
    
    p$elementId <- NULL
    p  
  })
  
  output$GCRscatterplot2 <- renderPlotly({
    p <-    plot_ly(data=happy.2016,x=~Happiness.Score,
                    y=~Trust..Government.Corruption.,
                    color=~Region,
                    type="scatter", mode = "markers",
                    marker = list(size = 15),
                    # Hover text:
                    text = ~paste("<b>Region:</b> ", Region, 
                                  "<br><b>Country:</b> ", Country,
                                  "<br><b>Happiness Score:</b>", Happiness.Score,
                                  "<br><b>Trust government corruption:</b>", Trust..Government.Corruption.)) %>%
      layout(xaxis=list(title="Happiness Score"),
             yaxis=list(title="Trust government corruption"))
    
    p$elementId <- NULL
    p  
  })
  
  output$GCRscatterplot3 <- renderPlotly({
    p <-    plot_ly(data=happy.2017,x=~Happiness.Score,
                    y=~Trust..Government.Corruption.,
                    color=~Region,
                    type="scatter", mode = "markers",
                    marker = list(size = 15),
                    # Hover text:
                    text = ~paste("<b>Region:</b> ", Region, 
                                  "<br><b>Country:</b> ", Country,
                                  "<br><b>Happiness Score:</b>", Happiness.Score,
                                  "<br><b>Trust government corruption:</b>", Trust..Government.Corruption.)) %>%
      layout(xaxis=list(title="Happiness Score"),
             yaxis=list(title="Trust government corruption"))
    p$elementId <- NULL
    p  
  })

  ################################################################################################################
  #################### Happiness vs Family Satisfaction ##########################################################
  
  output$FSscatterplot1 <- renderPlotly({
    p <-    plot_ly(data=happy.2015,x=~Happiness.Score,
                    y=~Family,
                    color=~Region,
                    type="scatter", mode = "markers",
                    marker = list(size = 15),
                    # Hover text:
                    text = ~paste("<b>Region:</b> ", Region, 
                                  "<br><b>Country:</b> ", Country,
                                  "<br><b>Happiness Score:</b>", Happiness.Score,
                                  "<br><b>Family Satisfaction: </b>", Family)) %>%
      layout(xaxis=list(title="Happiness Score"),
             yaxis=list(title="Family Satisfaction"))
    
    p$elementId <- NULL
    p  
  })
  
  output$FSscatterplot2 <- renderPlotly({
    p <-    plot_ly(data=happy.2016,x=~Happiness.Score,
                    y=~Family,
                    color=~Region,
                    type="scatter", mode = "markers",
                    marker = list(size = 15),
                    # Hover text:
                    text = ~paste("<b>Region:</b> ", Region, 
                                  "<br><b>Country:</b> ", Country,
                                  "<br><b>Happiness Score:</b>", Happiness.Score,
                                  "<br><b>Family Satisfaction: </b>", Family)) %>%
      layout(xaxis=list(title="Happiness Score"),
             yaxis=list(title="Family Satisfaction"))
    
    p$elementId <- NULL
    p  
  })
  
  output$FSscatterplot3 <- renderPlotly({
    p <-    plot_ly(data=happy.2017,x=~Happiness.Score,
                    y=~Family,
                    color=~Region,
                    type="scatter", mode = "markers",
                    marker = list(size = 15),
                    # Hover text:
                    text = ~paste("<b>Region:</b> ", Region, 
                                  "<br><b>Country:</b> ", Country,
                                  "<br><b>Happiness Score:</b>", Happiness.Score,
                                  "<br><b>Family Satisfaction: </b>", Family)) %>%
      layout(xaxis=list(title="Happiness Score"),
             yaxis=list(title="Family Satisfaction"))
    p$elementId <- NULL
    p  
  })
 
  ################################################################################################################
  #################### LifeExpectancy vs Economy #################################################################
   
  output$LEvsEconomyplot1 <- renderPlotly({
    p <-    plot_ly(data=happy.2015,x=~Health..Life.Expectancy.,
                    y=~Economy..GDP.per.Capita.,
                    color=~Region,
                    type="scatter", mode = "markers",
                    marker = list(size = 15),
                    # Hover text:
                    text = ~paste("<b>Region:</b> ", Region, 
                                  "<br><b>Country:</b> ", Country,
                                  "<br><b>Health Life Expectancy:</b>", Health..Life.Expectancy.,
                                  "<br><b>GDP per Capita: </b>", Economy..GDP.per.Capita.)) %>%
      layout(xaxis=list(title="Health Life Expectancy"),
             yaxis=list(title="GDP per Capita"))
    
    p$elementId <- NULL
    p  
  })
  
  output$LEvsEconomyplot2 <- renderPlotly({
    p <-    plot_ly(data=happy.2016,x=~Health..Life.Expectancy.,
                    y=~Economy..GDP.per.Capita.,
                    color=~Region,
                    type="scatter", mode = "markers",
                    marker = list(size = 15),
                    # Hover text:
                    text = ~paste("<b>Region:</b> ", Region, "<br><b>Country:</b> ", Country,
                                  "<br><b>Health Life Expectancy:</b>", Health..Life.Expectancy.,
                                  "<br><b>GDP per Capita: </b>", Economy..GDP.per.Capita.)) %>%
      layout(xaxis=list(title="Health Life Expectancy"),
             yaxis=list(title="GDP per Capita"))
    
    p$elementId <- NULL
    p  
  })
  
  output$LEvsEconomyplot3 <- renderPlotly({
    p <-    plot_ly(data=happy.2017,x=~Health..Life.Expectancy.,
                    y=~Economy..GDP.per.Capita.,
                    color=~Region,
                    type="scatter", mode = "markers",
                    marker = list(size = 15),
                    # Hover text:
                    text = ~paste("<b>Region:</b> ", Region, 
                                  "<br><b>Country:</b> ", Country,
                                  "<br><b>Health Life Expectancy:</b>", Health..Life.Expectancy.,
                                  "<br><b>GDP per Capita: </b>", Economy..GDP.per.Capita.)) %>%
      layout(xaxis=list(title="Health Life Expectancy"),
             yaxis=list(title="GDP per Capita"))
    p$elementId <- NULL
    p  
  }) 
  
 ################################################################################################################
  #################### Ratings In Maps ##########################################################################
  output$RatingsInMaps1 <- renderPlot({
    ggplot(happy.2015,aes(x=Region,y=Happiness.Score))+geom_violin(aes(fill=factor(Region)),alpha=0.6)+theme(axis.text.x = element_text(angle=90, vjust=0.6))+labs(title="Happiness Scores in Regions-2015",x="Region",y="Score")})
  
  output$RatingsInMaps2 <- renderPlot(
    {ggplot(happy.2016,aes(x=Region,y=Happiness.Score))+geom_violin(aes(fill=factor(Region)),alpha=0.6)+theme(axis.text.x = element_text(angle=90, vjust=0.6))+labs(title="Happiness Scores in Regions-2016",x="Region",y="Score")})
  
  
  output$RatingsInMaps3 <-  renderPlot({
    ggplot(happy.2017,aes(x=Region,y=Happiness.Score))+geom_violin(aes(fill=factor(Region)),alpha=0.6)+theme(axis.text.x = element_text(angle=90, vjust=0.6))+labs(title="Happiness Scores in Regions-2017",x="Region",y="Score")})
  
  
  
  ############################################################################################################
  ########################################### GDPplot
  output$GDPplot1 <- renderPlot({
    n <- joinCountryData2Map(GDP2015, joinCode="NAME", nameJoinColumn="country")
    mapCountryData(n, nameColumnToPlot="value", mapTitle="World Map for GDP per Capita-2015",colourPalette="terrain")
    
    n
  })
  
  output$GDPplot2 <- renderPlot({
    n <- joinCountryData2Map(GDP2016, joinCode="NAME", nameJoinColumn="country")
    mapCountryData(n, nameColumnToPlot="value", mapTitle="World Map for GDP per Capita-2016",colourPalette="terrain")
    
    n
  })
  
  output$GDPplot3 <- renderPlot({
    n <- joinCountryData2Map(GDP2017, joinCode="NAME", nameJoinColumn="country")
    mapCountryData(n, nameColumnToPlot="value", mapTitle="World Map for GDP per Capita-2017",colourPalette="terrain")
    
    n
  })
  
  ############################################################################################################
  ########################################### Freedom
  cp <- RColorBrewer::brewer.pal(7,'RdPu')
  
  output$Freeplot1 <- renderPlot({
    n <- joinCountryData2Map(Freedom2015, joinCode="NAME", nameJoinColumn="country")
    mapCountryData(n, nameColumnToPlot="value", mapTitle="World Map for Freedom - 2015",colourPalette=cp,borderCol='black')
    
    n
  })
  
  output$Freeplot2 <- renderPlot({
    n <- joinCountryData2Map(Freedom2016, joinCode="NAME", nameJoinColumn="country")
    mapCountryData(n, nameColumnToPlot="value", mapTitle="World Map for Freedom - 2016",colourPalette=cp,borderCol='black')
    
    n
  })
  
  output$Freeplot3 <- renderPlot({
    n <- joinCountryData2Map(Freedom2017, joinCode="NAME", nameJoinColumn="country")
    mapCountryData(n, nameColumnToPlot="value", mapTitle="World Map for Freedom - 2017",colourPalette=cp,borderCol='black')
    
    n
  })
  
  ############################################################################################################
  ########################################### Relation between Happiness score and Trust Govenment Corruption
  output$CtryHapplot1 <- renderPlot({
    p <- ggplot(happy.2015,aes(x=Happiness.Score,y=Trust..Government.Corruption.,color=Region,size=Trust..Government.Corruption.))+geom_point(alpha=0.6)+labs(title="Happiness Score with Trust Government Corruption-2015")
    
    p})
  output$CtryHapplot2 <- renderPlot({p <- ggplot(happy.2016,aes(x=Happiness.Score,y=Trust..Government.Corruption.,color=Region,size=Trust..Government.Corruption.))+geom_point(alpha=0.6)+labs(title="Happiness Score with Trust Government Corruption-2016")
  
  p})
  output$CtryHapplot3 <- renderPlot({p <- ggplot(happy.2017,aes(x=Happiness.Score,y=Trust..Government.Corruption.,color=Region,size=Trust..Government.Corruption.))+geom_point(alpha=0.6)+labs(title="Happiness Score with Trust Government Corruption-2017")
  
  p})
  
  
  ############################################################################################################
  ########################################### Economy vs Life Expectancy
  myPalette <- colorRampPalette(rev(brewer.pal(7, "Accent")))
  
  output$ecvsLifeExplot1 <- renderPlot({ggplot(happy.2015,aes(x=(Health..Life.Expectancy.*100),y=Economy..GDP.per.Capita.))+geom_point(aes(size=Economy..GDP.per.Capita.,color=Economy..GDP.per.Capita.),alpha=.7)+theme(legend.position="none")+geom_smooth()+scale_colour_gradientn(colours = myPalette(100), values=seq(0, 100, length.out=100)/100) + 
                                         geom_text(aes(label=Country), size=3,color="black")+labs(title="Economy vs Life Expectancy",x="Life Expectany")})
  output$ecvsLifeExplot2 <- renderPlot({ggplot(happy.2016,aes(x=(Health..Life.Expectancy.*100),y=Economy..GDP.per.Capita.))+geom_point(aes(size=Economy..GDP.per.Capita.,color=Economy..GDP.per.Capita.),alpha=.7)+theme(legend.position="none")+geom_smooth()+scale_colour_gradientn(colours = myPalette(100), values=seq(0, 100, length.out=100)/100) + 
                                         geom_text(aes(label=Country), size=3,color="black")+labs(title="Economy vs Life Expectancy",x="Life Expectany")})
  output$ecvsLifeExplot3 <- renderPlot({ggplot(happy.2017,aes(x=(Health..Life.Expectancy.*100),y=Economy..GDP.per.Capita.))+geom_point(aes(size=Economy..GDP.per.Capita.,color=Economy..GDP.per.Capita.),alpha=.7)+theme(legend.position="none")+geom_smooth()+scale_colour_gradientn(colours = myPalette(100), values=seq(0, 100, length.out=100)/100) + 
                                         geom_text(aes(label=Country), size=3,color="black")+labs(title="Economy vs Life Expectancy",x="Life Expectany")})
  
  ############################################################################################################
  ########################################### Top 10
  
  output$Top10plot <- renderPlot({
    gtop1<-ggplot(top10_2015,aes(x=factor(Country,levels=Country),y=Happiness.Rank))+geom_bar(stat="identity",width=0.5,fill="navyblue")+theme(axis.text.x = element_text(angle=90, vjust=0.6))+labs(title="Top10 Happiest Countries-2015",x="Country",y="Rank")
    gtop2<-ggplot(top10_2016,aes(x=factor(Country,levels=Country),y=Happiness.Rank))+geom_bar(stat="identity",width=0.5,fill="darkred")+theme(axis.text.x = element_text(angle=90, vjust=0.6))+labs(title="Top10 Happiest Countries-2016",x="Country",y="Rank")
    gtop3<-ggplot(top10_2017,aes(x=factor(Country,levels=Country),y=Happiness.Rank))+geom_bar(stat="identity",width=0.5,fill="green")+theme(axis.text.x = element_text(angle=90, vjust=0.6))+labs(title="Top10 Happiest Countries-2017",x="Country",y="Rank")
    grid.arrange(gtop1, gtop2,  gtop3, ncol = 3,nrow=1)
  
  })
  
  
  
  ############################################################################################################
  ########################################### Bottom 10
  
  output$Bottom10plot <- renderPlot({   
  
    gbottom1<-ggplot(bottom10_2015,aes(x=factor(Country,levels=Country),y=Happiness.Score))+geom_bar(stat="identity",width=0.5,fill="navyblue")+theme(axis.text.x = element_text(angle=90, vjust=0.6))+labs(title="Bottom10 Happiest Countries-2015",x="Country",y="Score")+coord_flip()
    gbottom2<-ggplot(bottom10_2016,aes(x=factor(Country,levels=Country),y=Happiness.Score))+geom_bar(stat="identity",width=0.5,fill="darkred")+theme(axis.text.x = element_text(angle=90, vjust=0.6))+labs(title="Bottom10 Happiest Countries-2016",x="Country",y="Score")+coord_flip()
    gbottom3<-ggplot(bottom10_2017,aes(x=factor(Country,levels=Country),y=Happiness.Score))+geom_bar(stat="identity",width=0.5,fill="green")+theme(axis.text.x = element_text(angle=90, vjust=0.6))+labs(title="Bottom10 Happiest Countries-2017",x="Country",y="Score")+coord_flip()
    grid.arrange(gbottom1, gbottom2,gbottom3,  ncol = 3,nrow=1)
 })
  
  
  ############################################################################################################
  ########################################### Happiness Comparison  
  
  output$Btw1516 <- renderPlot({plot(ggHapSco)})
  output$Btw1617 <- renderPlot({plot(ggHapSco2)})
  
  ############################################################################################################
  ########################################### Regressions
  output$Regressionplot1 <- renderPlot({
    gg1<-ggplotRegression(lm(Happiness.Score ~ Dystopia.Residual, data = happy.2015))
    gg2<-ggplotRegression(lm(Happiness.Score ~ Generosity, data = happy.2015))
    gg3<-ggplotRegression(lm(Happiness.Score ~ Freedom, data = happy.2015))
    gg4<-ggplotRegression(lm(Happiness.Score ~ Economy..GDP.per.Capita., data = happy.2015))
    
    gg5<-ggplotRegression(lm(Happiness.Score ~ Family, data = happy.2015))
    gg6<-ggplotRegression(lm(Happiness.Score ~ Health..Life.Expectancy., data = happy.2015))
    gg7<-ggplotRegression(lm(Happiness.Score ~ Trust..Government.Corruption., data = happy.2015))
    gg8<-ggplotRegression(lm(Happiness.Score ~ Standard.Error, data = happy.2015))
    grid.arrange(gg1,gg2,gg3,gg4,gg5,gg6,gg7,gg8,ncol=2,nrow=4)
  })

  
  }

# Run the application 
shinyApp(ui = ui, server = server)

