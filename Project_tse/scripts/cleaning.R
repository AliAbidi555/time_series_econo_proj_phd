library(dplyr)
library(janitor)
library(lubridate)
library(zoo)
library(reshape2)
library(tseries)
library(urca)
library(tinytex)

library(tidyr)

low_state<-read.csv("Data/low_state.csv")
low_state[is.na(low_state)]=0
low_state<-low_state[,!head(low_state,1)==0]

#Other Time Series
prices_diff<-read.csv("Data/prices_data.csv")
labor_series<-read.csv("Data/labor_series.csv")


names(low_state)[names(low_state) == "RegionName"] <- "Date"


#Drop empty columns

#fORMAT DATES
low_state_ts<-ts(data = low_state,start = c(1996,4),frequency = 12)

prices_diff<-ts(data=prices_diff,start = c(1996,1),frequency=12)
labor_series<-ts(data=labor_series, start = c(1996,1),frequency = 12)

low_state<-data.frame(Yl=as.matrix(low_state_ts),date=as.Date(as.yearmon(time(low_state_ts))))


#Generating Differences
low_state_ts_diff<-diff(low_state_ts,differences = 2)

labor_series<-diff(labor_series,differences=2)


#merge some series and turn rest into dataframes


merged_ts_low<-ts.intersect(low_state_ts_diff,prices_diff,labor_series)


#Turn everything into datafeames
merged_ts_low_df<-data.frame(Yl=as.matrix(merged_ts_low),date=as.Date(as.yearmon(time(merged_ts_low))))

low_state_diff<-data.frame(Yl=as.matrix(low_state_ts_diff),date=as.Date(as.yearmon(time(low_state_ts_diff))))




