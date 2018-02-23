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

source("HappineesQuotient-script.R")

ui <- dashboardPage(
  dashboardHeader(title = "Happiness Quotient"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Brief Intro", tabName = NULL, icon = icon("info-circle"),
               menuSubItem("Intoduction", tabName = "intro", icon = icon("database")),
               menuSubItem("Project Guidelines", tabName ="ProjectGuidelines", icon = icon("stack-overflow")),
               menuSubItem("Context", tabName = "Context", icon = icon("thermometer-full")),
               menuSubItem("Inspiration", tabName = "Inspiration", icon = icon("cubes"))
             
      ),
      menuItem("Dystopia", tabName = "dystopia", icon = icon("tint")),
      
      menuItem("Factors", tabName = NULL, icon = icon("bars"),
              menuSubItem("Economy by Regions", tabName = "economy", icon = icon("stack-overflow")),
              menuSubItem("Life Expectancy", tabName = "lifeExpectancy", icon = icon("thermometer-full")),
              menuSubItem("Trust Government Corruption", tabName = "corruption", icon = icon("sign-language")),
              menuSubItem("Family Satisfaction", tabName = "familySatisfaction", icon = icon("users")),
              menuSubItem("Freedom", tabName = "freedom", icon = icon("blind"))
              ),
      menuItem("Comparisons", tabName = NULL, icon = icon("bars"),
             menuSubItem("Correlations", tabName = "correlations", icon = icon("delicious")),   
             menuSubItem("GDP", tabName = "GDP", icon = icon("sitemap")),
             menuSubItem("Continents' Happiness Scores", tabName = "CtryHapScore", icon = icon("simplybuilt")),
             menuSubItem("Happiness Ratings in Regions", tabName = "ratingsinmap", icon = icon("dashboard")),
             menuSubItem("Economy vs Life Expectancy", tabName = "ecvsLifeEx", icon = icon("heartbeat"))
            ),
      menuItem("Conclusion", tabName = "Conclusions", icon = icon("slideshare")),
      menuItem("References", tabName = "Bibliography", icon = icon("briefcase"))
    )
  
  ),
  dashboardBody(
    # Boxes need to be put in a row (or column)
 tabItems( 

      tabItem(tabName = "intro",
              h2("512-90: Final Project Dashboard"),
              h3("The Happiness Quotient Dashboard is the final project submission by Smitha Shivakumar."),
              h4("This Dashboard talks about the World Happiness Quotient, which is a world survey data collected in 2015 to 2017."), 
              h4("It was one of the Data Science Challenges on Kaggle(https://www.kaggle.com/unsdsn/world-happiness)."),
              h4("This dataset has been taken to conduct various Visualizations to understand the Happiness Quotient in different parts of the country and conduct a comparative
                 analysis on the same."),

              h3("The Brief Intro tab"),
               h4("comprises of the Project Guidelines as set by Prof.Alan Hitch, the Context of this data as given on Kaggle and 
                 finally the Inspiration to work on this particular dataset."),
              h3("The Dystopia tab"),
              h4("talks about how we are setting the benchmark and what exactly it adds to the model. It is informative."),
              h3("The Factors tab"),
              h4("conducts more of an Univariate Analysis with interactive Scatterplots, giving the user a general idea on what the
                 data represents."),
              h3("The Comparisons tabs"),
              h4(" have Bivariate Analysis which have World Maps and different graphs to give a better representation and 
                 understanding of the data."),
              h3("The Conclusion tab "),
              h4("summaries all findings with simple bar charts, comparison charts and regression plots to show how the Happiness Scores have moved across the years and what effects them."),
              h3("the Reference tab"),
              h4(" has all the various nooks and corners of the internet I surveyed to help me put this project together."),


              h4("-  Smitha")
              ),
      
      tabItem(tabName = "ProjectGuidelines",              
                title = "Project Guidelines",

                   
                h3("Key Objectives:"),
                   
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
                h3("The World Happiness Report is a landmark survey of the state of global happiness."),
                h4("The first report was published in 2012, the second in 2013, the third in 2015, and the fourth 
                   in the 2016 Update."), h4("The World Happiness 2017, which ranks 155 countries by their happiness 
                   levels, was released at the United Nations at an event celebrating International Day of Happiness
                   on March 20th."), h4("The report continues to gain global recognition as governments, organizations and 
                   civil society increasingly use happiness indicators to inform their policy-making decisions."), 
                   h4("Leading experts across fields - economics, psychology, survey analysis, national statistics, 
                   health, public policy and more - describe how measurements of well-being can be used effectively 
                   to assess the progress of nations."),h4("The reports review the state of happiness in the world today 
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
             
             h3("What are the residuals?"),
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
                h3("What do the columns succeeding the Happiness Score(like Family, Generosity, etc.) describe?"),
             h4("  

                "),  
             h4("The following columns: "),
             h4("GDP per Capita, "),
             h4("Family, "),
             h4("Life Expectancy, "),
             h4("Freedom, "),
             h4("Generosity, "),
             h4("Trust Government Corruption"),
             h4("describe the extent to which these factors contribute in evaluating the happiness in each country. 
                The Dystopia Residual metric actually is the Dystopia Happiness Score(1.85) + the Residual value or the unexplained 
                value for each country as stated in the previous answer."),
                
              h4("If all these factors are added up, we might get the happiness score which might be un-reliable to model to predict Happiness Scores as there is multicorrelation.")
             

      ),
 
     tabItem(tabName = "ratingsinmap",
             h2("Happiness Scores by Region"),
           
               box(tabsetPanel(
                 tabPanel("2015",plotlyOutput("boxplot1")),
                 tabPanel("2016",plotlyOutput("boxplot2")),
                 tabPanel("2017",plotlyOutput("boxplot3"))
               ), height = 500, width = 700),
               box(
                 title = "Happiness by Regions",
                 h4("Hover on the graph"),
                 h4("The whole of Australia seems to be on the similar mental space of Happiness."),
                 h4("However, that is not the case with other regions. Even though Europe has countries 
                    with happier score than Australia there are countires within Europe which are not happy at all, 
                    so not an even spectrum of resources in Europe."),
                 h4("NorthAmerica comes a close second with Australia in the Happiness Score but it too does have a smaller pockets
                    with not so happy regions. However it doesn't see such a wide gap in resources as in Europe."),
                 h4("Asia and South America also have a basket of mediocre happiness score. However Africa takes majority of space in the lower spectrum of the Happiness score."),
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
               h4("Hover on the graph"),
               h4("Europen countries on an overall have higher GDP and higher level of Happiness amongst the other regions."),
               h4("African countries on the other hand have lower GDP and lesser levels of Happiness."),
               h4("So we do see there is a certain amount of correlation between the GDP and Happiness Quotient.")
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
               h4("Hover on the graph"),
               h4("Europe and North American countries on the overall have higher Life Expectancy and higher level of Happiness amongst the other regions."),
               h4("Africa and some Asian countries on the other hand have lower Life Expectancy and lesser level of Happiness."),
               h4("So we do see there is a relation between the Life Expectancy and Happiness Quotient. Or is it because they are happy, they live longer?")
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
               h4("Hover on the graph"),
               h4("Europe and North American countries on the overall have higher Trust in Government Corruption and higher level of Happiness amongst the other regions."),
               h4("Africa and some Asian countries on the other hand have lower Trust in Government Corruption and lesser level of Happiness."),
               h4("So we do see there is a relation between the Trust in Government Corruption and Happiness Quotient.")
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
               h4("Hover on the graph"),
               h4("Europe and North American countries on the overall have higher Family Satisfaction and higher level of Happiness amongst the other regions."),
               h4("Africa and some Asian countries on the other hand have lower Family Satisfaction and lesser level of Happiness."),
               h4("So we do see there is a relation between the Family Satisfaction and Happiness Quotient."),
               h4(" This makes us curious to find to what levels are each of these factors related, so moving to the next section of Comparisons.")
               , height = 500, width = 700)
     ),
     
     tabItem(tabName = "freedom",
             title = "Happiness vs Freedom by Regions",
             h2("Freedom"),
             box(tabsetPanel(
               tabPanel("2015",plotlyOutput("Freescatterplot1")),
               tabPanel("2016",plotlyOutput("Freescatterplot2")),
               tabPanel("2017",plotlyOutput("Freescatterplot3"))
             ), height = 500, width = 700),
             box(
               h4("Hover on the graph"),
               h4("Europe and North American countries on the overall have higher Freedom and higher level of Happiness amongst the other regions."),
               h4("Africa and some Asian countries on the other hand have lower Freedom and lesser level of Happiness."),
               h4("So we do see there is a relation between the Freedom and Happiness Quotient."),
               h4(" This makes us curious to find to what levels are each of these factors related, so moving to the next section of Comparisons.")
               , height = 500, width = 700)
     ),
     
     tabItem(tabName = "correlations",
             title = "Correlation Plot",
             box(tabsetPanel(
               tabPanel("2015",plotOutput("Corrplot1")),
               tabPanel("2016",plotOutput("Corrplot2")),
               tabPanel("2017",plotOutput("Corrplot3"))
             ), height = 500, width = 700),
             box(
               h4("Correlation Plots"),
               h4("In all the three years we see that there is a strong correlation with the Economy GDP per Capita and Happiness."),
               h4("Family Satisfaction and Life Expectancy come a close second with a more pronounced correlation in 2017"),
               h4("Freedom comes third with having a correlation of in and around 0.5"),
               h4("Trust in Governement Corruption and Genorisity have very low correlation to the Happiness Score.")
               , height = 500, width = 700)
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
               h4("This Map Plot takes 5 seconds to load."),
               h4("This Map Plot shows the GDP of each country in the world and it is on a scale from 0 to 1.69. "),
               h4("The countries with 0 GDP rating are the countires we have no data for. The current dataset has data for 153 countries on the avergae over 3 years and don't have data from 88 countries in the world"),
               h4("United States, Canada, Australia, Switzerland, Finalnd and Qatar have been consistently the front runner with higher GDP per capita."),
               h4("Russia and some on the other European countries have degraded from high GDP to not so well, over the years from 2015-2017.")               
               , height = 500, width = 700)
             ),

     
     tabItem(tabName = "CtryHapScore",
             title = "Continent Happiness Plot",
             box(tabsetPanel(
               tabPanel("2015",plotOutput("CtryHapplot1")),
               tabPanel("2016",plotOutput("CtryHapplot2")),
               tabPanel("2017",plotOutput("CtryHapplot3"))
             ), height = 600, width = 700),
             box(
               title = "Happiness in Continents",
               h4("Countries in United States have the highest Trust in the Government Corruption, Africa comes second with their Trust in Government Corruption."),
               h4("However, this trust doesn't translate into Happiness because Europe turns out to be the Happiest Region amongst all and Africa seems to be the least happiest region."),
               h4("This proves our correlation plot where we found that Trust in Government has a very weak realtion with the region's happiness.")               
               , height = 500, width = 700)
             
               
             ),
     tabItem(tabName = "ecvsLifeEx",
             title = "Economy vs Life Expectation Plot",
             box(tabsetPanel(
               tabPanel("2015",plotOutput("ecvsLifeExplot1")),
               tabPanel("2016",plotOutput("ecvsLifeExplot2")),
               tabPanel("2017",plotOutput("ecvsLifeExplot3"))
             ), height = 500, width = 700),
             box(
               title = "Economy vs Life Expectancy",
               h4("Singapore is at the peak of this chart with the high Life Expectancy and GDP per Capita "),
               h4("Qatar is certainly a cut above the rest with highest GDP per capita however that doesn't seem to show with their Life Expectancy."),
               h4("Hongkong has been a constant neighbor to Singapore and sometimes(2016) sharing the  high Life Expectancy and GDP combination with Singapore"),
               h4("Sierra Leono has remained at the bottom of this chart with the lowest Life Expectancy and GDP per Capita "),
               h4("Other African countires like Lesotho and Chad have slid into the lower region of Life Expectancy and GDP per Capita")
               , height = 500, width = 700)
             
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
               h4("From the graphs above it is seen that the countries with top Happiness Scores have just shuffled around and stayed happy int eh time frame we checked."),
               h4("Similarly for the Lower Happier COuntries. However we do see the names of countries having lower happiness score are the ones which have terrorist attacks on them more often than anyone would like."),
               h4("From the analysis we see that the there has been a slight increase in the Happiness Quotient over the years. People all around the world have the general idea to move towards 
                  prosperity and as we saw Economy GDP per capita seem to have the highest impact on the Happiness Score."),
               h4("The regression plots for each factor vs the Happiness Score can be seen and it stengthes our correlation plots with statistical numbers."),
               h4("Overall, in the process of answering the 5 main questions, a lot more realities about the dataset have been explored."),
               h4("Next step to this would be to check the effects of terrorist attacks on the World welfare and more tuned towards making this analysis helpful towards social welfare awareness")
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
  #################### Happiness vs Freedom ##############################################################
  
  output$Freescatterplot1 <- renderPlotly({
    p <-    plot_ly(data=happy.2015,x=~Happiness.Score,
                    y=~Freedom,
                    color=~Region,
                    type="scatter", mode = "markers",
                    marker = list(size = 15),
                    # Hover text:
                    text = ~paste("<b>Region:</b> ", Region, 
                                  "<br><b>Country:</b> ", Country,
                                  "<br><b>Happiness Score:</b>", Happiness.Score,
                                  "<br><b>Freedom:</b>", Freedom)) %>%
      layout(xaxis=list(title="Happiness Score"),
             yaxis=list(title="Freedom"))
    
    p$elementId <- NULL
    p  
  })
  
  output$Freescatterplot2 <- renderPlotly({
    p <-    plot_ly(data=happy.2016,x=~Happiness.Score,
                    y=~Freedom,
                    color=~Region,
                    type="scatter", mode = "markers",
                    marker = list(size = 15),
                    # Hover text:
                    text = ~paste("<b>Region:</b> ", Region, 
                                  "<br><b>Country:</b> ", Country,
                                  "<br><b>Happiness Score:</b>", Happiness.Score,
                                  "<br><b>Freedom:</b>", Freedom)) %>%
      layout(xaxis=list(title="Happiness Score"),
             yaxis=list(title="Freedom"))
    
    p$elementId <- NULL
    p  
  })
  
  output$Freescatterplot3 <- renderPlotly({
    p <-    plot_ly(data=happy.2017,x=~Happiness.Score,
                    y=~Freedom,
                    color=~Region,
                    type="scatter", mode = "markers",
                    marker = list(size = 15),
                    # Hover text:
                    text = ~paste("<b>Region:</b> ", Region, 
                                  "<br><b>Country:</b> ", Country,
                                  "<br><b>Happiness Score:</b>", Happiness.Score,
                                  "<br><b>Freedom:</b>", Freedom)) %>%
      layout(xaxis=list(title="Happiness Score"),
             yaxis=list(title="Freedom"))
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

  # tryCatch({
  #   # some other code
  # }, warning = function(war){
  #   logwarn(war, logger = "MyLogger")
  # }, error = function(err){
  #   # edit the error message
  #   err$message <- paste("While training model", err, sep = " ")
  #   # and re-raise
  #   stop(err)
  # })
  
  }

# Run the application 
shinyApp(ui = ui, server = server)

