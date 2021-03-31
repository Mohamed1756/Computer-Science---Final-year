iris = read.csv('/Users/mohamed/Desktop/iris.csv', sep = ',')
irisClass = read.csv('/Users/mohamed/Desktop/ClusteringLab_R_v1/iris_real.csv', sep = ',')

irisData = cbind(irisClass,iris) #Combines both data into one 
iris_rand = irisData [sample(149,149),] #randomize data 

irisclasses = iris_rand [,1] #separates the class and takes the first coloumn 
irisOther = iris_rand [,-1] #place other attributes into its own data 

# now we build a training set of the first 75% and test the other 25% 
irisclassTrain = irisclasses [1:100]
irisvaluesTrain = irisOther [1:100,]

irisclassTest = irisclasses [101:149]
irisvaluesTest = irisOther [101:149,]

#Q1. Learn a decision tree for the 3 classes of iris.

#Decision tress 
library(rpart)

fit <- rpart(irisclassTrain~., method = "class", data= irisvaluesTrain)
#Plotting decision tree 
plot(fit,uniform = TRUE, main = "Decision Tree for Iris")
text(fit, use.n = TRUE, all = TRUE, cex = .7) #find out what it does 



#Q2.Test it by scoring the accuracy on test data using different degrees of pruning using prune.

list <- seq(0.1, 0.9, by = 0.1)
j = 1
pruneScore <- list()

for (i in list){
  pfit <- prune(fit,cp=i)
  treepred <- predict(pfit, irisvaluesTest, type = "class")
  n = length(irisclassTest) # number of test cases 
  nCorrect =  sum (treepred == irisclassTest) #number of correctly predicted 
  accuracy = nCorrect / n
  
  pruneScore [[j]] = accuracy
  j <- j+1
}

plot(treepred, uniform =TRUE, main = "Pruned Decision tree for iris")
text(fit, use.n = TRUE, all = TRUE, cex = .7) #find out what it does 
plot(list, pruneScore,xlab= "cp values ", ylab = "Accuracy Score", main = "accuracy of test data using different degrees of pruning ")

# Q3. Scatterplot 2 selected variables of the data (and colour code according to the decision tree output), display the learnt tree and calculate the accuracy.

irisvaluestrain2 = irisvaluesTrain [,c("X5.1","X1.4")]
irisvaluestest2 = irisvaluesTest [,c("X5.1","X1.4")]
plot (irisvaluesTrain$X5.1,irisvaluesTrain$X1.4,col= c("red","blue"))
# col=c(irisclassTrain)
Scatterfit<- rpart(irisclassTrain~.,method = "class", data = irisvaluestrain2)

plot (Scatterfit, uniform = TRUE, main = "Decision Tree for selected variables (X5.1 & X1.4) ")
text(Scatterfit, use.n = TRUE, all = TRUE, cex = .7) #find out what it does 

