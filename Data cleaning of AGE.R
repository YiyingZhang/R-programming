stem(default$AGE)##show max,min,and medium

default$AGE[default$AGE>50]<-"Elder"
default$AGE[default$AGE>=30 & default$AGE<=50]<-"Middle Age"
default$AGE[default$AGE<30]<-"Young"
default$AGE

##outliers
install.packages("ggplot2")
library(ggplot2)
summary(default)
ggplot(default,aes(x=B_1))+geom_histogram(fill="white",colour="black")+
  #facet_grid(B_2~B_,scales = "free")
  xlim(0,max(default$B_1))+
  ylim(0,8000)
                
##from B_1 to P_A4,all variables have outliers, replace these outliers with thier upper bond
lower.quartile<-as.numeric(summary(default$B_1)[2])
upper.quartile<-as.numeric(summary(default$B_1)[5])
IQR<-upper.quartile-lower.quartile
upper.bound<-upper.quartile+1.5*IQR
message("upper.bound on this variable is ",upper.bound)
default$B_1[default$B_1>upper.bound]<-upper.bound

summary(default$B_1)# now the max value of B_1 is the upper bond
