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
library(repr)
library(gridExtra)
library(treemap)
library(ellipse)
library(rworldmap)
library(ggalt)

happy.2015 <- read.csv("C:/Users/smitha.shivakumar/Documents/R/HappinessQuotient/Data2015.csv")
happy.2016 <- read.csv("C:/Users/smitha.shivakumar/Documents/R/HappinessQuotient/Data2016.csv")
happy.2017 <- read.csv("C:/Users/smitha.shivakumar/Documents/R/HappinessQuotient/Data2017.csv")

convertregion <- function(yearname){
  
  yearname$Region <- as.character(yearname$Region)
  yearname$Country <- as.character(yearname$Country)
  countrylist.2015 <- yearname[yearname$Region=="Middle East and Northern Africa","Country"]
  countrylist.2015.continent <- countrycode(countrylist.2015, 'country.name', 'continent')
  cont.cont.2015 <- data.frame(Country=countrylist.2015,Region=countrylist.2015.continent,stringsAsFactors = FALSE)
  
  x <- length(yearname[yearname$Region=="Middle East and Northern Africa","Country"])
  
  for (i in 1:x){
    tomatch <- yearname[yearname$Region=="Middle East and Northern Africa","Country"][1]
    regiontomatch <- cont.cont.2015[cont.cont.2015$Country==tomatch,"Region"]
    yearname[yearname$Region=="Middle East and Northern Africa","Region"][1] <- regiontomatch
  }
  yearname$Region
}

happy.2015$Region <- convertregion(happy.2015)
happy.2016$Region <- convertregion(happy.2016)


# Retrieve region for 2017
n2017 <- nrow(happy.2017) #number of rows in 2107
happy.2017$Region <- rep(NULL,n2017)

# Run the loop

for (i in 1:length(happy.2017$Country)){
  tomatch <- as.character(happy.2017$Country[i])
  regiontomatch <- as.character(happy.2016[happy.2016$Country==tomatch,"Region"])
  if (length(regiontomatch)==1)
    happy.2017$Region[i] <- regiontomatch
  else
    happy.2017$Region[i] <- tomatch
}


happy.2017$Region <- convertregion(happy.2017)



# Rename regions to 7 continents
recode.countries <- c("Australia and New Zealand"="Australia and New Zealand", 
                      "Central and Eastern Europe"="Europe",
                      "Eastern Asia"="Asia",
                      "Latin America and Caribbean"="South America",
                      # "Middle East and Northern Africa"="Africa",
                      "North America"="North America",
                      "Southeastern Asia"="Asia",
                      "Southern Asia"="Asia",
                      "Sub-Saharan Africa"="Africa",
                      "Western Europe"="Europe")

recode.countries.2017 <- c("Australia and New Zealand"="Australia and New Zealand", 
                           "Central and Eastern Europe"="Europe",
                           "Eastern Asia"="Asia",
                           "Hong Kong S.A.R., China"="Asia",
                           "Latin America and Caribbean"="South America",
                           "Central African Republic"="Africa",
                           "Lesotho"="Africa",
                           # "Middle East and Northern Africa"="Africa",
                           "Mozambique"="Africa",
                           "North America"="North America",
                           "Southeastern Asia"="Asia",
                           "Southern Asia"="Asia",
                           "Sub-Saharan Africa"="Africa",
                           "Taiwan Province of China"="Asia",
                           "Western Europe"="Europe")

happy.2015$Region <- revalue(happy.2015$Region,recode.countries)
happy.2016$Region <- revalue(happy.2016$Region,recode.countries)
happy.2017$Region <- revalue(happy.2017$Region,recode.countries.2017)

#reorder the levels
happy.2015$Region <- factor(happy.2015$Region, 
                            levels=c("Australia and New Zealand","Europe","Asia",
                                     "South America","Africa","North America"),ordered=FALSE)
happy.2016$Region <- factor(happy.2016$Region, 
                            levels=c("Australia and New Zealand","Europe","Asia",
                                     "South America","Africa","North America"),ordered=FALSE)

happy.2017$Region <- factor(happy.2017$Region, 
                            levels=c("Australia and New Zealand","Europe","Asia",
                                     "South America","Africa","North America"),ordered=FALSE)



levels(happy.2015$Region)

happy.2015.corr <- happy.2015[,c(4,6:12)]
happy.2015.cormatr <- round(cor(happy.2015.corr), 2)

happy.2016.corr <- happy.2016[,c(4,6:12)]
happy.2016.cormatr <- round(cor(happy.2016.corr), 2)

happy.2017.corr <- happy.2017[,c(4,6:12)]
happy.2017.cormatr <- round(cor(happy.2017.corr), 2)

# Correlation fucntion
cor.mtest <- function(mat, ...) {
  mat <- as.matrix(mat)
  n <- ncol(mat)
  p.mat<- matrix(NA, n, n)
  diag(p.mat) <- 0
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      tmp <- cor.test(mat[, i], mat[, j], ...)
      p.mat[i, j] <- p.mat[j, i] <- tmp$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  p.mat
}

p.mat.2015 <- cor.mtest(happy.2015.corr)
p.mat.2016 <- cor.mtest(happy.2016.corr)
p.mat.2017 <- cor.mtest(happy.2017.corr)


## Map view of Happiness ratings in different countries{.tabset}
###2015

happy.2015$code <- countrycode(happy.2015$Country, 'country.name', 'iso3c')
happy.2015[happy.2015$Country=="Kosovo","code"] <- "XKX"

# light grey boundaries
l <- list(color = toRGB("grey"), width = 0.5)

# specify map projection/options
g <- list(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = list(type = 'Mercator')
)




###2016

happy.2016$code <- countrycode(happy.2016$Country, 'country.name', 'iso3c')
happy.2016[happy.2016$Country=="Kosovo","code"] <- "XKX"

# light grey boundaries
l <- list(color = toRGB("grey"), width = 0.5)

# specify map projection/options
g <- list(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = list(type = 'Mercator')
)





###2017

happy.2017$code <- countrycode(happy.2017$Country, 'country.name', 'iso3c')
happy.2017[happy.2017$Country=="Kosovo","code"] <- "XKX"

# light grey boundaries
l <- list(color = toRGB("grey"), width = 0.5)

# specify map projection/options
g <- list(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = list(type = 'Mercator')
)


#############Top20 Happiness Countries
#2015
top20_2015<-happy.2015 %>% filter(Happiness.Rank<=20)%>% arrange(desc(Happiness.Rank))
top20_2015$label<-paste(top20_2015$Country,top20_2015$Happiness.Rank,top20_2015$Happiness.Score,sep="\n ")

#2016
top20_2016<-happy.2016 %>% filter(Happiness.Rank<=20)%>% arrange(desc(Happiness.Rank))
top20_2016$label<-paste(top20_2016$Country,top20_2016$Happiness.Rank,top20_2016$Happiness.Score,sep="\n ")


#2017
top20_2017<-happy.2017 %>% filter(Happiness.Rank<=20)%>% arrange(desc(Happiness.Rank))
top20_2017$label<-paste(top20_2017$Country,top20_2017$Happiness.Rank,top20_2017$Happiness.Score,sep="\n ")




###############Barcharts between years Top 10 Countries
top10_2015<-happy.2015 %>% select(Country,Region,Happiness.Rank,Happiness.Score) %>% head(n=10)
top10_2016<-happy.2016 %>% select(Country,Region,Happiness.Rank,Happiness.Score) %>% head(n=10)
top10_2017<-happy.2017 %>% select(Country,Region,Happiness.Rank,Happiness.Score) %>% head(n=10)



###############Barcharts between years Bottom 10 Countries
bottom10_2015<-happy.2015 %>% select(Country,Region,Happiness.Rank,Happiness.Score) %>% tail(n=10)
bottom10_2016<-happy.2016 %>% select(Country,Region,Happiness.Rank,Happiness.Score) %>% tail(n=10)
bottom10_2017<-happy.2017 %>% select(Country,Region,Happiness.Rank,Happiness.Score) %>% tail(n=10)


###############Compare GDP per captita of countries in year 2015 , 2016 & 2017
#2015
GDP2015 <- data.frame(
  country=happy.2015$Country,
  value=happy.2015$Economy..GDP.per.Capita.)

#2016
GDP2016 <- data.frame(
  country=happy.2016$Country,
  value=happy.2016$Economy..GDP.per.Capita.)

#2017
GDP2017 <- data.frame(
  country=happy.2017$Country,
  value=happy.2017$Economy..GDP.per.Capita.)



##############Compare Freedom of countries in year 2015 , 2016 & 2017
#2015
Freedom2015 <- data.frame(
  country=happy.2015$Country,
  value=happy.2015$Freedom)

#2016
Freedom2016 <- data.frame(
  country=happy.2016$Country,
  value=happy.2016$Freedom)

#2017
Freedom2017 <- data.frame(
  country=happy.2017$Country,
  value=happy.2017$Freedom)


####################Correlation Matrix
data2015=cor(happy.2015[, 3:12])


my_colors2015 <- brewer.pal(7, "Greens")
my_colors2015=colorRampPalette(my_colors2015)(100)

# Order the correlation matrix
ord2015 <- order(data[1, ])
data_ord2015 = data[ord2015, ord2015]

#2016

data2016=cor(happy.2016[, 3:12])


my_colors2016 <- brewer.pal(7, "Blues")
my_colors2016=colorRampPalette(my_colors2016)(100)

# Order the correlation matrix
ord2016 <- order(data[1, ])
data_ord2016 = data[ord2016, ord2016]

#2017
data2017=cor(happy.2017[, 3:12])


my_colors2017 <- brewer.pal(7, "Oranges")
my_colors2017=colorRampPalette(my_colors2017)(100)

# Order the correlation matrix
ord2017 <- order(data[1, ])
data_ord2017 = data[ord2017, ord2017]


###################### Regressions

ggplotRegression <- function (fit) {
  
  
  
  ggplot(fit$model, aes_string(x = names(fit$model)[2], y = names(fit$model)[1])) + 
    geom_point(shape=1,size=3,color="#003399")+
    stat_smooth(method = "lm", col = "red") +
    labs(title = paste("R2 = ",signif(summary(fit)$r.squared, 5),
                       "Intercept =",signif(fit$coef[[1]],5 ),
                       " Slope =",signif(fit$coef[[2]], 5),
                       " P =",signif(summary(fit)$coef[2,4], 5)))
}

# gg1<-ggplotRegression(lm(Happiness.Score ~ Dystopia.Residual, data = happy.2015))
# gg2<-ggplotRegression(lm(Happiness.Score ~ Generosity, data = happy.2015))
# gg3<-ggplotRegression(lm(Happiness.Score ~ Freedom, data = happy.2015))
# gg4<-ggplotRegression(lm(Happiness.Score ~ Economy..GDP.per.Capita., data = happy.2015))
# 
# gg5<-ggplotRegression(lm(Happiness.Score ~ Family, data = happy.2015))
# gg6<-ggplotRegression(lm(Happiness.Score ~ Health..Life.Expectancy., data = happy.2015))
# gg7<-ggplotRegression(lm(Happiness.Score ~ Trust..Government.Corruption., data = happy.2015))
# gg8<-ggplotRegression(lm(Happiness.Score ~ Standard.Error, data = happy.2015))



########################Happiness Score Comparisons


d15<-happy.2015 %>% select(Country,Region,HS15=Happiness.Score)
d16<-happy.2016 %>% select(Country,Region,HS16=Happiness.Score)
d17<-happy.2017 %>% select(Country,Region,HS17=Happiness.Score)


score<-inner_join(d15,d16)%>% mutate(score_diff= HS16-HS15)%>% filter(score_diff>0)

score2 <-inner_join(d16,d17)%>% mutate(score_diff= HS17-HS16)%>% filter(score_diff>0)


score$Country <- factor(score$Country, levels=as.character(score$Country))

score2$Country <- factor(score2$Country, levels=as.character(score2$Country))


ggHapSco <- ggplot(score, aes(x=HS15, xend=HS16, y=Country, group=Country)) + 
  geom_dumbbell(size=2, color="#e3e2e1", 
                colour_x = "#5b8124", colour_xend = "#bad744",
                dot_guide=TRUE, dot_guide_size=0.25) + 
  labs(x=NULL, 
       y=NULL, 
       
       title=" Country Happiness Scores Increased: 2015 vs 2016"
  ) +
  theme(plot.title = element_text(hjust=0.5, face="bold"),
        plot.background=element_rect(fill="#f7f7f7"),
        panel.background=element_rect(fill="#f7f7f7"),
        panel.grid.minor=element_blank(),
        panel.grid.major.y=element_blank(),
        panel.grid.major.x=element_line(),
        axis.ticks=element_blank(),
        legend.position="top",
        panel.border=element_blank())


ggHapSco2 <- ggplot(score2, aes(x=HS16, xend=HS17, y=Country, group=Country)) + 
  geom_dumbbell(size=2, color="#e3e2e1", 
                colour_x = "#5b8124", colour_xend = "#bad744",
                dot_guide=TRUE, dot_guide_size=0.25) + 
  labs(x=NULL, 
       y=NULL, 
       
       title=" Country Happiness Scores Increased: 2016 vs 2017"
  ) +
  theme(plot.title = element_text(hjust=0.5, face="bold"),
        plot.background=element_rect(fill="#f7f7f7"),
        panel.background=element_rect(fill="#f7f7f7"),
        panel.grid.minor=element_blank(),
        panel.grid.major.y=element_blank(),
        panel.grid.major.x=element_line(),
        axis.ticks=element_blank(),
        legend.position="top",
        panel.border=element_blank())
