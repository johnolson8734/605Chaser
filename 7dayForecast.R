# Load R packages
install.packages("jsonlite")
install.packages("shiny")
install.packages("shinythemes")
install.packages("tidyverse")
install.packages("openssl")
install.packages("curl")
install.packages("httr")
install.packages("DT")
install.packages("LibCurl")
install.packages("RCurl")
install.packages("RODBC")
install.packages("DBI")
install.packages("rlist")
install.packages("rjson")
install.packages("dplyr")
#install.packages("XML")  # once per machine
#install.packages("libcurl3-openssl-dev")
#install.packages(c("httr", "jsonlite", "lubridate"))



library(httr)
library(shiny)
library(shinythemes)
#library(tidyverse)
library(openssl)
library(dplyr)
library(jsonlite)
library(lubridate)
library(httr)
library(RCurl)
library(RODBC)
library(DBI)
library(rjson)
library(dplyr)
##bring up if you always install new versions of packages you might want to wrap them up 
##so that it wont affect longe term... packrat is one option
# john.olson8734 4605Chaser
# Key :    e45f874831deef023b0230826a6329f5
#sioux falls Lat/Long : 43.5460° N, 96.7313° W
#link for openwether
# https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}


#10 day forecast get AIP call for each location needed
#Declare and set variables that will be reused

APR <- "&"
Key <- "e45f874831deef023b0230826a6329f5"
Equal <- "="
Comma <- ","
URL1 <- "https://api.weather.gov/gridpoints/"
URLEnd <- "/forecast?units=us"

#############################################
####  Sioux Falls 10 day  ###################
#############################################

Lat <- 43
Long <- 96
RadarLocation <- "FSD/"
LocationID <- 1
#build URL for this location
URLBuild = paste0(URL1,RadarLocation,Lat,Comma,Long,URLEnd)
URLBuild # see variable can be removed

getInfoInJson <- httr::GET(URLBuild)
#add_headers('Authorization' = 'Bearer 31232187asdsadh23187'))
#save the info in a json object 
jsonInfoImg <- content(getInfoInJson, type="application/json")
jsonInfoImg
#########################################################
##### Collect all data points needed  ###################
#########################################################

PeriodOfDay           <- jsonInfoImg$properties$periods[[1]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[1]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[1]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[1]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[1]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[1]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[1]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[1]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row1 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[2]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[2]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[2]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[2]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[2]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[2]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[2]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[2]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row2 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[3]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[3]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[3]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[3]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[3]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[3]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[3]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[3]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row3 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[4]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[4]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[4]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[4]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[4]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[4]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[4]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[4]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row4 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[5]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[5]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[5]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[5]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[5]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[5]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[5]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[5]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row5 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[6]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[6]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[6]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[6]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[6]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[6]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[6]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[6]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row6 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[7]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[7]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[7]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[7]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[7]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[7]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[7]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[7]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row7 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[8]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[8]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[8]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[8]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[8]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[8]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[8]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[8]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row8 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[9]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[9]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[9]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[9]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[9]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[9]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[9]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[9]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row9 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[10]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[10]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[10]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[10]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[10]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[10]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[10]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[10]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row10 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[11]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[11]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[11]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[11]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[11]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[11]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[11]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[11]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row11 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[12]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[12]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[12]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[12]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[12]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[12]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[12]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[12]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row12 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[13]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[13]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[13]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[13]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[13]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[13]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[13]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[13]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row13 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[14]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[14]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[14]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[14]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[14]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[14]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[14]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[14]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row14 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

################################################
####  Make all values into a row of a table ####
################################################

df1 <- t(data.frame(Row1))
df2 <- t(data.frame(Row2))
df3 <- t(data.frame(Row3))
df4 <- t(data.frame(Row4))
df5 <- t(data.frame(Row5))
df6 <- t(data.frame(Row6))
df7 <- t(data.frame(Row7))
df8 <- t(data.frame(Row8))
df9 <- t(data.frame(Row9))
df10 <- t(data.frame(Row10))
df11 <- t(data.frame(Row11))
df12 <- t(data.frame(Row12))
df13 <- t(data.frame(Row13))
df14 <- t(data.frame(Row14))

############################
####  bring into table  ####
############################

Forecast <- rbind(df1, df2, df3, df4, df5, df6, df7, df8, df9, df10, df11, df12, df13, df14)
#Assign ColumnNames
colnames(Forecast) <- c("LocationID", "DateName","DateStart", "DateEnd", "Temp", "PercipitationPercentage", "WindSpeed", "WindDirection" ,"PeriodDetailForecast")
Forecast
#SiouxFallsForecastdata = as.data.frame(mget(paste0("Row", 1:10)))

#database connection
db <- DBI::dbConnect(odbc::odbc(),
                      driver = "SQL Server",
                      server = "Olson-Laptop1",
                      database = "DataCollection",
                      uid = "sa",
                      pwd = "4Support1")
#db       <- odbcDriverConnect('driver={SQL Server};server=Olson-Laptop1;database=DataCollection;trusted_connection=true')
#after connection, insert into database
sqlSave(db, Forecast, rownames = FALSE, append = TRUE) # add records to existing table
close(db)
#############################################
####  Rapid city 10 day  ####################
#############################################

Lat <- 44
Long <- 103
RadarLocation <- "RAP/"
LocationID <- 2
#build URL for this location
URLBuild = paste0(URL1,RadarLocation,Lat,Comma,Long,URLEnd)
#URLBuild # see variable can be removed

getInfoInJson <- httr::GET(URLBuild)
#add_headers('Authorization' = 'Bearer 31232187asdsadh23187'))
#save the info in a json object 
jsonInfoImg <- content(getInfoInJson, type="application/json")
#########################################################
##### Collect all data points needed  ###################
#########################################################

PeriodOfDay           <- jsonInfoImg$properties$periods[[1]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[1]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[1]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[1]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[1]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[1]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[1]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[1]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row1 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[2]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[2]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[2]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[2]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[2]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[2]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[2]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[2]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row2 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[3]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[3]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[3]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[3]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[3]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[3]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[3]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[3]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row3 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[4]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[4]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[4]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[4]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[4]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[4]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[4]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[4]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row4 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[5]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[5]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[5]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[5]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[5]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[5]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[5]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[5]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row5 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[6]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[6]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[6]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[6]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[6]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[6]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[6]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[6]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row6 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[7]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[7]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[7]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[7]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[7]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[7]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[7]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[7]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row7 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[8]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[8]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[8]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[8]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[8]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[8]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[8]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[8]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row8 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[9]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[9]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[9]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[9]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[9]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[9]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[9]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[9]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row9 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[10]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[10]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[10]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[10]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[10]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[10]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[10]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[10]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row10 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[11]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[11]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[11]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[11]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[11]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[11]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[11]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[11]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row11 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[12]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[12]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[12]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[12]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[12]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[12]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[12]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[12]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row12 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[13]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[13]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[13]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[13]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[13]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[13]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[13]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[13]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row13 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[14]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[14]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[14]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[14]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[14]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[14]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[14]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[14]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row14 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

################################################
####  Make all values into a row of a table ####
################################################

df1 <- t(data.frame(Row1))
df2 <- t(data.frame(Row2))
df3 <- t(data.frame(Row3))
df4 <- t(data.frame(Row4))
df5 <- t(data.frame(Row5))
df6 <- t(data.frame(Row6))
df7 <- t(data.frame(Row7))
df8 <- t(data.frame(Row8))
df9 <- t(data.frame(Row9))
df10 <- t(data.frame(Row10))
df11 <- t(data.frame(Row11))
df12 <- t(data.frame(Row12))
df13 <- t(data.frame(Row13))
df14 <- t(data.frame(Row14))

############################
####  bring into table  ####
############################

Forecast <- rbind(df1, df2, df3, df4, df5, df6, df7, df8, df9, df10, df11, df12, df13, df14)
#Assign ColumnNames
colnames(Forecast) <- c("LocationID", "DateName","DateStart", "DateEnd", "Temp", "PercipitationPercentage", "WindSpeed", "WindDirection" ,"PeriodDetailForecast")
Forecast
#SiouxFallsForecastdata = as.data.frame(mget(paste0("Row", 1:10)))

#database connection
db <- DBI::dbConnect(odbc::odbc(),
                     driver = "SQL Server",
                     server = "Olson-Laptop1",
                     database = "DataCollection",
                     uid = "sa",
                     pwd = "4Support1")
#db       <- odbcDriverConnect('driver={SQL Server};server=Olson-Laptop1;database=DataCollection;trusted_connection=true')
#after connection, insert into database
sqlSave(db, Forecast, rownames = FALSE, append = TRUE) # add records to existing table
close(db)

#############################################
####  Aberdeen 10 day  #####################
#############################################

Lat <- 45
Long <- 98
RadarLocation <- "ABR/"
LocationID <- 3
#build URL for this location
URLBuild = paste0(URL1,RadarLocation,Lat,Comma,Long,URLEnd)
#URLBuild # see variable can be removed

getInfoInJson <- httr::GET(URLBuild)
#add_headers('Authorization' = 'Bearer 31232187asdsadh23187'))
#save the info in a json object 
jsonInfoImg <- content(getInfoInJson, type="application/json")
#########################################################
##### Collect all data points needed  ###################
#########################################################

PeriodOfDay           <- jsonInfoImg$properties$periods[[1]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[1]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[1]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[1]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[1]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[1]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[1]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[1]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row1 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[2]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[2]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[2]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[2]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[2]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[2]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[2]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[2]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row2 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[3]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[3]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[3]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[3]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[3]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[3]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[3]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[3]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row3 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[4]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[4]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[4]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[4]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[4]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[4]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[4]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[4]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row4 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[5]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[5]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[5]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[5]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[5]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[5]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[5]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[5]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row5 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[6]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[6]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[6]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[6]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[6]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[6]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[6]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[6]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row6 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[7]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[7]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[7]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[7]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[7]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[7]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[7]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[7]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row7 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[8]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[8]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[8]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[8]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[8]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[8]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[8]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[8]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row8 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[9]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[9]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[9]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[9]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[9]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[9]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[9]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[9]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row9 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[10]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[10]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[10]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[10]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[10]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[10]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[10]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[10]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row10 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[11]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[11]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[11]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[11]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[11]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[11]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[11]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[11]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row11 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[12]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[12]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[12]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[12]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[12]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[12]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[12]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[12]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row12 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[13]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[13]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[13]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[13]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[13]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[13]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[13]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[13]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row13 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[14]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[14]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[14]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[14]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[14]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[14]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[14]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[14]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row14 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

################################################
####  Make all values into a row of a table ####
################################################

df1 <- t(data.frame(Row1))
df2 <- t(data.frame(Row2))
df3 <- t(data.frame(Row3))
df4 <- t(data.frame(Row4))
df5 <- t(data.frame(Row5))
df6 <- t(data.frame(Row6))
df7 <- t(data.frame(Row7))
df8 <- t(data.frame(Row8))
df9 <- t(data.frame(Row9))
df10 <- t(data.frame(Row10))
df11 <- t(data.frame(Row11))
df12 <- t(data.frame(Row12))
df13 <- t(data.frame(Row13))
df14 <- t(data.frame(Row14))

############################
####  bring into table  ####
############################

Forecast <- rbind(df1, df2, df3, df4, df5, df6, df7, df8, df9, df10, df11, df12, df13, df14)
#Assign ColumnNames
colnames(Forecast) <- c("LocationID", "DateName","DateStart", "DateEnd", "Temp", "PercipitationPercentage", "WindSpeed", "WindDirection" ,"PeriodDetailForecast")
Forecast
#SiouxFallsForecastdata = as.data.frame(mget(paste0("Row", 1:10)))

#database connection
db <- DBI::dbConnect(odbc::odbc(),
                     driver = "SQL Server",
                     server = "Olson-Laptop1",
                     database = "DataCollection",
                     uid = "sa",
                     pwd = "4Support1")
#db       <- odbcDriverConnect('driver={SQL Server};server=Olson-Laptop1;database=DataCollection;trusted_connection=true')
#after connection, insert into database
sqlSave(db, Forecast, rownames = FALSE, append = TRUE) # add records to existing table
close(db)
#############################################
####  Pierre 10 day  ########################
#############################################

Lat <- 44
Long <- 100
RadarLocation <- "ABR/"

LocationID <- 4
#build URL for this location
URLBuild = paste0(URL1,RadarLocation,Lat,Comma,Long,URLEnd)
#URLBuild # see variable can be removed

getInfoInJson <- httr::GET(URLBuild)
RadarLocation <- "PIE/"
#add_headers('Authorization' = 'Bearer 31232187asdsadh23187'))
#save the info in a json object 
jsonInfoImg <- content(getInfoInJson, type="application/json")
#########################################################
##### Collect all data points needed  ###################
#########################################################

PeriodOfDay           <- jsonInfoImg$properties$periods[[1]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[1]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[1]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[1]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[1]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[1]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[1]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[1]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row1 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[2]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[2]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[2]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[2]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[2]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[2]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[2]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[2]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row2 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[3]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[3]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[3]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[3]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[3]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[3]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[3]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[3]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row3 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[4]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[4]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[4]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[4]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[4]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[4]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[4]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[4]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row4 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[5]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[5]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[5]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[5]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[5]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[5]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[5]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[5]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row5 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[6]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[6]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[6]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[6]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[6]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[6]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[6]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[6]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row6 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[7]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[7]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[7]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[7]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[7]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[7]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[7]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[7]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row7 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[8]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[8]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[8]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[8]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[8]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[8]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[8]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[8]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row8 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[9]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[9]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[9]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[9]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[9]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[9]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[9]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[9]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row9 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[10]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[10]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[10]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[10]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[10]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[10]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[10]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[10]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row10 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[11]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[11]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[11]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[11]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[11]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[11]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[11]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[11]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row11 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[12]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[12]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[12]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[12]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[12]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[12]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[12]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[12]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row12 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[13]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[13]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[13]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[13]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[13]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[13]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[13]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[13]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row13 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

PeriodOfDay           <- jsonInfoImg$properties$periods[[14]]$name
PeriodStartDate       <- jsonInfoImg$properties$periods[[14]]$startTime
PeriodEndDate         <- jsonInfoImg$properties$periods[[14]]$endTime
Temperature           <- jsonInfoImg$properties$periods[[14]]$temperature
PercipitationPercent  <- jsonInfoImg$properties$periods[[14]]$probabilityOfPrecipitation$value
WindSpeed             <- jsonInfoImg$properties$periods[[14]]$windSpeed
WindDirection         <- jsonInfoImg$properties$periods[[14]]$windDirection
PeriodDetailForecast  <- jsonInfoImg$properties$periods[[14]]$detailedForecast
PercipitationPercent <- ifelse(is.null(PercipitationPercent), 0, PercipitationPercent)
Row14 <- c(LocationID,PeriodOfDay,PeriodStartDate,PeriodEndDate,Temperature,PercipitationPercent,WindSpeed,WindDirection,PeriodDetailForecast)

################################################
####  Make all values into a row of a table ####
################################################

df1 <- t(data.frame(Row1))
df2 <- t(data.frame(Row2))
df3 <- t(data.frame(Row3))
df4 <- t(data.frame(Row4))
df5 <- t(data.frame(Row5))
df6 <- t(data.frame(Row6))
df7 <- t(data.frame(Row7))
df8 <- t(data.frame(Row8))
df9 <- t(data.frame(Row9))
df10 <- t(data.frame(Row10))
df11 <- t(data.frame(Row11))
df12 <- t(data.frame(Row12))
df13 <- t(data.frame(Row13))
df14 <- t(data.frame(Row14))

############################
####  bring into table  ####
############################

Forecast <- rbind(df1, df2, df3, df4, df5, df6, df7, df8, df9, df10, df11, df12, df13, df14)
#Assign ColumnNames
colnames(Forecast) <- c("LocationID", "DateName","DateStart", "DateEnd", "Temp", "PercipitationPercentage", "WindSpeed", "WindDirection" ,"PeriodDetailForecast")
Forecast
#SiouxFallsForecastdata = as.data.frame(mget(paste0("Row", 1:10)))

#database connection
db <- DBI::dbConnect(odbc::odbc(),
                     driver = "SQL Server",
                     server = "Olson-Laptop1",
                     database = "DataCollection",
                     uid = "sa",
                     pwd = "4Support1")
#db       <- odbcDriverConnect('driver={SQL Server};server=Olson-Laptop1;database=DataCollection;trusted_connection=true')
#after connection, insert into database
sqlSave(db, Forecast, rownames = FALSE, append = TRUE) # add records to existing table
close(db)