iris = read.csv('/Users/mohamed/Desktop/iris.csv', sep = ',')
irisClass = read.csv('/Users/mohamed/Desktop/ClusteringLab_R_v1/iris_real.csv', sep = ',')

irisData = cbind(irisClass,iris) #Combines both data into one // 
iris_rand = irisData [sample(149,149),] #randomize data 

irisclasses = iris_rand [,1] #separates the class and takes the first coloumn 
irisOther = iris_rand [,-1] #place other attributes into its own data 

# now we build a training set of the first 75% and test the other 25% 
irisclassTrain = irisclasses [1:100]
irisvaluesTrain = irisOther [1:100,]

irisclassTest = irisclasses [101:149]
irisvaluesTest = irisOther [101:149,]

#Q1. Learn a decision tree for the 3 classes of iris.

install.packages("rpart.plot")
library(rpart)
library(rpart.plot)

dtfit <- rpart(irisclassTrain~.,method ="class",data = irisvaluesTrain)  

plot(dtfit,uniform = TRUE,main = "Decision tree for iris")
text(dtfit,use.n = TRUE, all = TRUE, cex=.7 )

#Q2. Test it by scoring the accuracy on test data using different degrees of pruning using prune.
myvec1 <- vector (mode = "numeric") 
for (i in 1:9){
  pfit <- prune(dtfit,cp=i/10) #0.1 - 0.9 (complexity parameter)
  treepred <- predict(pfit, irisvaluesTest, type = "class")
  n = length(irisclassTest) # number of test cases 
  nCorrect =  sum (treepred == irisclassTest) #number of correctly predicted 
  accuracy = nCorrect / n
  print(accuracy) 
  myvec1 <- append(myvec1,accuracy)
}
plot(myvec1, type = "l" , xlab = "CP values ", ylab = "Accuracy " , col = "red")

table_mat =table(irisclassTest, treepred) 
print(table_mat)

#Q3.Scatterplot 2 variables of iris, colour code according to the decision tree output, display the learnt tree and calculate the accuracy.

irisvaluestrain2 = irisvaluesTrain[,c("X5.1","X1.4")] # created new variable to store in 2 columns 
irisvaluestest2 = irisvaluesTest [,c("X5.1","X1.4")] #for prediction stage 

plot(irisOther$X5.1 ,irisOther$X1.4, col=c("red","green"),main = "Plot for X5.1 & X1.4",
     xlab = 'X5.1', ylab = 'X1.4' )


treepred<- predict(dtfit,method = "class", data = irisvaluesTest) #Decision tree
# plot 
aa = cbind(treepred,irisvaluesTest)
#Draw tree 
plot(Scatterfit, uniform = TRUE, main = "Decision tree for X5.1 & X1.4" )
text(Scatterfit,use.n = TRUE, all = TRUE, cex=.7 )
rpart.plot(Scatterfit,type = 5,under = TRUE, main ="" )

#prediction 

n2 = length(irisclassTest) # number of test cases 
nCorrect1 =  sum (treepred == irisclassTest) # predicting 
accuracy1 = nCorrect1 / n2
print(accuracy1) #test accuracy 

#Q4.Compare the accuracy of the different pruned trees to KNN with different values of k
myvec <- vector(mode = "numeric")
library(class)
k = c(3,5,7,9,11) # odd numbers for knn 
for (i in k){
knn_pred <- knn(irisvaluesTrain,irisvaluesTest,irisclassTrain, k=i)

knn_n = length(irisclassTest) #the number of test cases
knn_Correct1 = sum(knn_pred==irisclassTest) #the number of correctly predicted
knn_accuracy= knn_Correct1/knn_n
print(knn_accuracy)
myvec <- append(myvec,knn_accuracy)
}
plot(myvec, xlab = "k values", ylab = "Accuracy Score") # fairly accurate but small sample 
plot(myvec1,type = "l", xlab = "CP values ", ylab = "Accuracy Score", col= "red" ) #first few accurate but the rest have low accuracy score

