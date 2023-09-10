library(ggplot2)

p<-ggplot()+geom_line(data=low_state,aes(x=date,y=low_state$Yl.California),color="red")+geom_line(data=low_state,aes(x=date,y=low_state$Yl.New.York),color="blue")+geom_line(data=low_state,aes(x=date,y=low_state$Yl.Washington),color="brown")+labs(title = "Bottom-tier Housing Prices Between 1990 and 2019",x="Year",y="House Price")+ theme(legend.position="bottom")

p

  q<-ggplot()+geom_line(data=low_state_diff,aes(x=date,y=low_state_diff$Yl.California),color="red")
q

