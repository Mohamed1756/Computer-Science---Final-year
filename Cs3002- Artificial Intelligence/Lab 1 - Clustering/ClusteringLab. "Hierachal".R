mydata = read.csv('/Users/mohamed/Desktop/spaeth_01.csv' , sep = ",")
plot(mydata)

mydata = na.omit(mydata) # deletion of missing data 
plot(mydata)
mydata = scale(mydata) # Standardize variables 

d <- dist(mydata , method = "euclidean") # generates a matrix of euclidean distance between each datapoint 

fit <- hclust (d, method = "average") #uses H clustering - average link 
plot(fit) #Displays dendogram 

Hgroups <- cutree(fit, k=5) #Cuts tree into 5 clusters 
plot(fit)
rect.hclust(fit, k = 5, border = "red") # prints out the cluster with red highlighting it 

Hgroups <- cutree(fit, k = 7) # cut into 7 clusters 
plot(fit)
rect.hclust(fit, k = 7 , border = "green")

Hgroups <- cutree(fit, k = 2) # cut tree into 2 clusters 
plot(fit)
rect.hclust(fit, k = 2, border = "blue")

plot(mydata, col = Hgroups) #draws a scatterplot with the assinged clusters as colours 
plot(fit)
rect.hclust(fit, k = 5, border = "red")
rect.hclust(fit, k = 7 , border = "green")
rect.hclust(fit, k = 2, border = "blue")

fit <- hclust(d, method = "single") # Uses single link 
plot(fit)
Hgroups <- cutree(fit, k= 3) #cuts into 3 clusters 
rect.hclust(fit, k = 3, border = "red")

fit <- hclust(d, method = "complete") # uses complete link 
plot(fit)
Hgroups <- cutree(fit, k =4) # uses 4 clusters 
rect.hclust(fit, k = 4, border = "blue")
