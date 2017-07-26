library(rpart)
library(RWeka)
library(party)
#read the final dataset

data_2<-read.csv("C:\\Users\\MAHE\\Downloads\\tree_input1.csv")

#type cast it to data frame

adm_data<-as.data.frame(data_2)

#the second value is the name of the states, so we take only from 3 to 24 attribute coloumns 

adm_data<-adm_data[3:24]

#j48 model of decision tree

m1 <- J48(label~adm_data$Total.No..of.Road.Accidents.due.to.Fault.of.Driver
          +adm_data$Total.No..of.Road.Accidents.due.to.Fault.of.Pedestrian
          +adm_data$Total.No..of.Road.Accidents.due.to.Fault.of.Cyclist
          +adm_data$Number.of.Persons.Killed.due.to.Defect.in.Road.Condition
          +adm_data$Total.No..of.Road.Accidents.due.to.All.Other.Causes. ,data = adm_data)
#plotting the tree
if(require("party", quietly = TRUE)) plot(m1)

summary(m1)

#this is for cross validation here number of folds is 10
eval <- evaluate_Weka_classifier(m1, numFolds = 10, complexity = FALSE, 
                                     seed = 1, class = TRUE)
eval

library(FSelector)
#this is for checking gain ratio 
information.gain(label~., data = adm_data)
subset1.adm <- subset(adm_data,Total.No..of.Road.Accidents.due.to.Fault.of.Pedestrian > 0.127)
information.gain(label~., data = subset1.adm)
subset1.adm <- subset(adm_data,Total.No..of.Road.Accidents.due.to.Fault.of.Cyclist > 0.236)
information.gain(label~., data = subset1.adm)

#C5.0 decision tree
library(C50)
library(caTools)
d<-adm_data
split=sample.split(d$label,SplitRatio = 0.75)
train=subset(d,split==TRUE)
test=subset(d,split==FALSE)
treemodel<-C5.0(x=d[,1:21],y=d$label)
y<-plot(treemodel)
summary(treemodel)

test.label=predict(treemodel,test[,1:21])
r<-test.label
r
summary(r)

confMat<-table(test$label,test.label)

y<-plot(treemodel)
plot(test.label)
