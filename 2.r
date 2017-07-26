data_2<-read.csv("C:\\Users\\MAHE\\Downloads\\tree_input.csv")
data<-as.data.frame(read.csv("C:\\Users\\MAHE\\Downloads\\roadac.csv"))
labels(data)
newdata<-na.omit(data)
#bar-plot of different attributes 
barplot(m$Total.No..of.Road.Accidents.due.to.All.Other.Causes.[1:35], xlab="(states other)", ylab="no. of",main="plot",names.arg=seq(1,35,1))
