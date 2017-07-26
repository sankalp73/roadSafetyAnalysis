normalise<-function(x){
  maximum<-max(x)
  minimum<-min(x)
  x<-(((x-minimum)/(maximum-minimum))*(1-0))+0
  return(x)
}
data<-data[2:36]
for(i in seq(2,22,1))
{
  newdata[2:35,i]<-normalise(newdata[2:35,i])
}
data<-newdata
