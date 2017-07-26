install.packages("randomForest")
library(randomForest)
output.forest <- randomForest(label ~., 
                             data = adm_data
                             )
MDSplot(output.forest, adm_data$label)
# View the forest results.

print(output.forest) 

t<-getTree(output.forest, 2, labelVar=TRUE)
t
