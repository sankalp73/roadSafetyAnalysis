#min-max normalisation here normailse is the name of the function
normalise<-function(x){
  maximum<-max(x)
  minimum<-min(x)
  x<-(((x-minimum)/(maximum-minimum))*(1-0))+0
  return(x)
}

#removing the attribute total as max will always be total in min-max.Hence, removing total which is the 
#36th attributein coloumn. Therefore data[1:35,2:22]
newdata<-data[1:35,2:22]

#applying normalise for all the 22 coloumns
for(i in seq(2,22,1))
{
  newdata[1:35,i]<-normalise(newdata[1:35,i])
}

data<-newdata
#applying kmeans on the dataset
result<-kmeans(newdata[1:35,2:22],4,nstart=20)
#displaying the result
result

#plotting the scatter-plot for all the states
library(ggplot2)
ggplot(newdata, aes(Total.No..of.Road.Accidents.due.to.Fault.of.Driver ,Total.No..of.Road.Accidents.due.to.Weather.Condition,
                    color = newdata$States.UTs)) + geom_point()
#adding the cluster result to the data-frame
d<-newdata
d<-cbind(d,result$cluster)

#creating a new csv file with the cluster values
write.csv(d,"C:\\Users\\MAHE\\Downloads\\tree_input.csv")
clus<-read.csv("C:\\Users\\MAHE\\Downloads\\tree_input1.csv")

#plotting the cluster according to clusters 
ggplot(clus, aes(Total.No..of.Road.Accidents.due.to.Fault.of.Driver ,Total.No..of.Road.Accidents.due.to.Weather.Condition,
                    color = clus$label)) + geom_point()
