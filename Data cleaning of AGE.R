stem(default$AGE)##show max,min,and medium

default$AGE[default$AGE>50]<-"Elder"
default$AGE[default$AGE>=30 & default$AGE<=50]<-"Middle Age"
default$AGE[default$AGE<30]<-"Young"
default$AGE
