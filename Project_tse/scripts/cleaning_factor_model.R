
library(dplyr)
library(janitor)
library(lubridate)
library(zoo)
library(reshape2)
library(tseries)
library(urca)
library(tinytex)
library(tidyr)
library(vars)
library(Jmisc)

state_prices<-read.csv("Data/all_state.csv")
prices<-read.csv("Data/prices_data.csv")
state_prices<-state_prices[,-c(1)]


#Set NAs to 0 and remove those columns
prices[is.na(prices)]=0
state_prices[is.na(state_prices)]=0
state_prices<-state_prices[,!head(state_prices,1)==0]




#Turn into time series
states_ts<-ts(data = state_prices,start = c(1996,4),frequency = 12)
prices_diff<-ts(data=prices,start = c(1996,4),frequency = 12)



states_ts<-diff(states_ts, differences = 2)
merged<-ts.intersect(states_ts,prices_diff)




