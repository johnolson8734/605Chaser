# Load R packages
install.packages("jsonlite")
install.packages("shiny")
install.packages("shinythemes")
#install.packages(c("tidyverse", "readxl", "Rcpp"))
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
install.packages("XML")  # once per machine
install.packages("libcurl3-openssl-dev")
install.packages(c("httr", "jsonlite", "lubridate"))


library(tidyverse)
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
##bring up if you always install new versions of packages you might want to wrap them up (not needed if will keep same version)
##so that it wont affect longe term... packrat is one option
# john.olson8734 4605Chaser

#Declare and set variables that will be reused
#https://api.weather.gov/alerts/active?status=actual&message_type=alert&limit=500
#just one URl
APR <- "&"
Key <- "L37YX4RHPV3HFJQ8NSAFUCCEA" #John key
Equal <- "="
Comma <- ","
Slash <- "/"
#URL1 <- "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/"
#Location <- "Sioux%20falls%20sd/"
#StartDate <- as.Date("1970-01-01")
#EndDate <- as.Date("1970-12-31")
#URL2 <- "?unitGroup=us&key="
#URLEnd <- "contentType=json"
FullURL <- "https://api.weather.gov/alerts/active?status=actual&message_type=alert&limit=500"
########################################
####  Get Active Alerts  ###############
########################################
#URLBuild = paste0(URL1,Location,StartDate,Slash,EndDate,URL2,Key,APR,URLEnd)
URLBuild <- FullURL

getInfoInJson <- httr::GET(URLBuild)
#add_headers('Authorization' = 'Bearer 31232187asdsadh23187'))
#save the info in a json object 
response <- content(getInfoInJson, type="application/json")
i <- 1
# set max length of # of alerts
MaxarrLength <- length(pluck(response,'features'))
MaxarrLength
#set table with temp row
Alerts <- data.frame(
                  col1 = "Effective",
                  col2 = "Onset",
                  col3 = "Expires",
                  col4 = "Ends",
                  col5 = "Status",
                  col6 = "messageType",
                  col7 = "severity",
                  col8 = "certainty",
                  col9 = "urgency",
                  col10 = "event",
                  col11 = "senderName",
                  col12 = "headline",
                  col13 = "description"
                )
 
#########################################################
##### Collect all data points needed  ###################
#########################################################
  # Convert the features into a data frame with a loop
repeat 
{
  if ( i <= MaxarrLength)
  {
  Effective             <- response$features[[i]]$properties$effective
  Onset                 <- response$features[[i]]$properties$onset
  Expires               <- response$features[[i]]$properties$expires
  Ends                  <- response$features[[i]]$properties$ends
  Status                <- response$features[[i]]$properties$status
  messageType           <- response$features[[i]]$properties$messageType
  severity              <- response$features[[i]]$properties$severity
  certainty             <- response$features[[i]]$properties$certainty
  urgency               <- response$features[[i]]$properties$urgency
  event                 <- response$features[[i]]$properties$event
  senderName            <- response$features[[i]]$properties$senderName
  headline              <- response$features[[i]]$properties$headline
  description           <- response$features[[i]]$properties$description
  # fix null values
  Effective <- ifelse(is.null(Effective), 0, Effective)
  Onset <- ifelse(is.null(Onset), 0, Onset)
  Expires <- ifelse(is.null(Expires), 0, Expires)
  Ends <- ifelse(is.null(Ends), 0, Ends)
  Status <- ifelse(is.null(Status), 0, Status)
  messageType <- ifelse(is.null(messageType), 0, messageType)
  severity <- ifelse(is.null(severity), 0, severity)
  certainty <- ifelse(is.null(certainty), 0, certainty)
  urgency <- ifelse(is.null(urgency), 0, urgency)
  event <- ifelse(is.null(event), 0, event)
  senderName <- ifelse(is.null(senderName), 0, senderName)
  headline <- ifelse(is.null(headline), 0, headline)
  description <- ifelse(is.null(description), 0, description)
  #create data frame
  Row <- c(Effective,Onset,Expires,Ends,Status,messageType,severity,certainty,urgency,event,senderName,headline,description)
  #combine rows together
  Alerts <- rbind(Alerts,Row)
  i <- i + 1
  }
  
  if (i > MaxarrLength) 
    {
    break  # Exits the loop once i is greater than highest alert #
    }
}


#Assign ColumnNames
colnames(Alerts) <- c("Effective","Onset","Expires","Ends","Status","messageType","severity","certainty","urgency","event","senderName","headline","description")
#remove test data row to setup table
Alerts <- Alerts[ !(Alerts$Effective %in% c("Effective")), ]
#SiouxFallsForecastdata = as.data.frame(mget(paste0("Row", 1:10)))

#database connection
db <- DBI::dbConnect(odbc::odbc(),
                      driver = "SQL Server",
                      server = "Olson-Laptop1",
                      database = "DataCollection",
                      uid = "username",
                      pwd = "Password")
#db       <- odbcDriverConnect('driver={SQL Server};server=Olson-Laptop1;database=DataCollection;trusted_connection=true')
#after connection, insert into database
sqlSave(db, Alerts, rownames = FALSE, append = TRUE) # add records to existing table
close(db)