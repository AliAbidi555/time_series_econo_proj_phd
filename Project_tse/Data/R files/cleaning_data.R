1
library(dplyr)
library(janitor)
library(tidyverse)
library(lubridate)
library(zoo)
library(reshape2)
low_state<-read.csv("C:\\Users\\Ali Abidi\\Google Drive\\PhD\\Semester 4\\Time series\\Data\\low_state.csv")
high_state<-read.csv("C:\\Users\\Ali Abidi\\Google Drive\\PhD\\Semester 4\\Time series\\Data\\top_state.csv")
names(low_state)[names(low_state) == "RegionName"] <- "Date"
names(high_state)[names(high_state) == "RegionName"] <- "Date"

#Drop empty columns
low_state$New.Mexico<-NULL
low_state$Montana<-NULL
low_state$South.Dakota<-NULL
low_state$North.Dakota<-NULL
low_state$Wyoming<-NULL
low_state$RegionName<-NULL
high_state$RegionName<-NULL
high_state$New.Mexico<-NULL
high_state$Montana<-NULL
high_state$South.Dakota<-NULL
high_state$North.Dakota<-NULL
high_state$Wyoming<-NULL
low_state$Date<-NULL
high_state$Date<-NULL

#fORMAT DATES
low_state<-ts(data = low_state,start = c(1996,4),frequency = 12)
high_state<-ts(data = high_state,start = c(1996,4),frequency = 12)
low_state<-data.frame(Yl=as.matrix(low_state),date=as.Date(as.yearmon(time(low_state))))
high_state<-data.frame(Yh=as.matrix(high_state),date=as.Date(as.yearmon(time(high_state))))

low_state_ts_diff<-diff(low_state_ts)
high_state_ts_diff<-diff(high_state_ts)
low_state_diff<-data.frame(Yl=as.matrix(low_state_ts_diff),date=as.Date(as.yearmon(time(low_state_ts_diff))))
high_state_diff<-data.frame(Yh=as.matrix(high_state_ts_diff),date=as.Date(as.yearmon(time(high_state_ts_diff))))

