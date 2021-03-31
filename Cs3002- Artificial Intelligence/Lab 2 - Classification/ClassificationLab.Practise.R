winedata = read.csv('/Users/mohamed/Desktop/winedata3.csv',  sep = ',')
winedata #first column represents the class numbers (1-3) & columns 2-14 represent different attributes 

wineClass = winedata[ ,1] #separates the class and takes the first coloumn 
wineValues = winedata [ ,-1 ] #place other attributes into its own data 

#Now let’s build a training set of the first 100 values (rows) and test set of the remaining (101 – 178) values.

wineclassTrain = wineClass[1:100]
winevaluesTrain = wineValues [1:100,] #training set of the first 100 values 

wineclassTest = wineClass [100:178]
winevaluesTest = wineValues [100:178, ] #test the values from 100-178

#Decision tress 
install.packages("rpart")
library(rpart)
fit <- rpart(wineclassTrain~., method = "class", data = winevaluesTrain)

#Plotting decision tree 
plot(fit,uniform = TRUE, main = "Decision Tree for wineData3")
text(fit, use.n = TRUE, all = TRUE, cex = .8) #find out what it does 

#testing the classifier on the test set by making predicitons for each test case in our set 
treepred <- predict(fit,winevaluesTest,type = "class")
#compare the actual test case value to get the accuracy 
n = length(wineclassTest) # number of test cases 
nCorrect =  sum (treepred == wineclassTest) #number of correctly predicted 
accuracy = nCorrect/n
print (accuracy)

#view the result in a confusion matrix - determines accuracy 
table_matrix= table(wineclassTest, treepred)
print(table_matrix)

#see pruning value (we set cp=0.1)
pfit <- prune(fit,cp = 0.1)
plot(pfit,uniform = TRUE, main = "Pruned Decision Tree for wineData3")
text(fit, use.n = TRUE, all = TRUE, cex = .8) #find out what it does 


#K Nearest Neighbourgh 
install.packages("class")
library(class)
# generate predicted classes 
knn3pred = knn(winevaluesTrain, winevaluesTest,wineclassTrain, k =3)

#calculate accuracy 
n = length(wineclassTest) #number of test cases
nCorrect = sum(knn3pred == wineclassTest) #number of correctly predicted 
accuracy = nCorrect/n
print(accuracy)
