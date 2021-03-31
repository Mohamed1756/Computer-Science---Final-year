install.packages("neuralnet")
library(neuralnet)

#OR gate input data 
trainin = rbind(c(1,1), c(1,-1), c(-1,1), c(-1,-1));
#OR gate output data 
trainout = rbind (1,1,1,0) #answers for the input data - OR problem only "1" has to be present 
#combine data 
ORdata = cbind(trainout,trainin)

#setting up binary perceptron with 2 inputs & 1 output - using neural net to train it 
set.seed(2)
NN = neuralnet (ORdata[,1]~., ORdata[,-1], hidden = 0, threshold = 0.001,stepmax = 1e+05, linear.output = FALSE)
plot(NN)

#check weights 
NN$weights
# compute - to see if the network responds to an input signal (1,1)
testin = rbind(c(1,1), c(1,-1), c(-1,1), c(-1,-1))
predict_testNN = compute(NN,testin)
predict_testNN$net.result
# threshold - calculate discrete class 
predict_out = as.numeric(predict_testNN$net.result > 0.5)
print(predict_out)

#XOR problem - MultiNN to solve 
trainXOR = rbind(c(1,1),c(1,-1), c(-1,1),c(-1,-1))
trainout_XOR = rbind (0,1,1,0)
XORdata = cbind(trainout_XOR,trainXOR)

set.seed(2)
NN = neuralnet (XORdata[,1]~., XORdata[,-1], hidden = c(3,3), threshold = 0.001,stepmax = 1e+05, linear.output = FALSE)
plot(NN)

#testing 
testin_XOR = rbind(c(1,1),c(1,-1), c(-1,1),c(-1,-1))
testout_XOR = rbind (0,1,1,0)
predict_XORNN = compute(NN,testin_XOR)
predict_XORNN$neurons 
predict_XORNN$net.result
predict_XOR = as.numeric(predict_XORNN$net.result > 0.5)
print(predict_XOR)

#replacing values to 0's and 1's - 
  #wine_class = replace(wine_class,wine_class == 1,0)
  #wine_class = replace(wine_class,wine_class == 2,1)
  
