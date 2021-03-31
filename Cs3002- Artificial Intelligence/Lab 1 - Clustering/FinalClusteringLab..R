mydata = read.csv('/Users/mohamed/Desktop/iris.csv', sep = ",") #read in the iris & iris.csv data
mydataReal = read.csv('/Users/mohamed/Desktop/ClusteringLab_R_v1/iris_real.csv', sep = ",")

mydata = na.omit(mydata) #omits data 
mydata = scale(mydata) #Standardize variables 

source("/Users/mohamed/Desktop/WK_R.r") # weighted kappa  

# Q1. Calculate the WK for kmeans clustering with different values of K 

kmeansdf <- data.frame()

K = 6   #k cluster 

for (i in 2:K) {
  kmfit <- kmeans(mydata,i) # generates cluster allocation 
  
  
  wk = WK_R(kmfit$cluster, mydataReal$X1) 
  
  kmeansdf [i,1] <- wk # stores the wk values into the first coloumn 
}
plot(df$V1, main = "Kmeans Clustering", xlab = "Number of Clusters", ylab = "WK Value") # type = l for line plot 

# Q.2 Hierarchical Clustering 

d <- dist(mydata, method = "euclidean") #using euclidean distance to calculate two points 

# this section shows Hierarchical clustering with different measures 
hcfitSingle <- hclust(d,method = "single")# : the smallest distance between any two pairs from the two clusters  

hcfitAverage <- hclust (d,method = "average") # the average distance between pairs 

hcfitComplete <-hclust(d,method = "complete") # the largest distance between any two pairs being compared/measured

####### Q.3 Plot dendograms for each cluster 
plot (hcfitSingle) #
plot (hcfitAverage)
plot (hcfitComplete)


#creates clusters by cutting this dendogram 
hclustSingle <- cutree(hcfitSingle, k = 3 ) 
rect.hclust(hcfitSingle, k = 3 , border = "red")

hclustAverage <- cutree(hcfitAverage, k = 3)
rect.hclust(hcfitAverage, k=3, border = "blue")

hclustComplete <- cutree(hcfitComplete, k = 3)
rect.hclust(hcfitComplete, k=3, border = "green")


####### Q.4 ScatterPlots 

## Use scatterplots to show different clusterings - with colours 

plot(mydata, col = hclustSingle)
plot(mydata, col = hclustAverage)
plot(mydata, col = hclustComplete)



##### Q5. plot the weighted Kappa values on a appropiate graph  
## compared to iris real

wk1 = WK_R(hclustAverage, mydataReal$X1) 
wk2 = WK_R (hclustSingle, mydataReal$X1)
wk3 = WK_R (hclustComplete, mydataReal$X1)

plot(wk1,main = "Hcluster Average vs iris real", xlab = "Number of Clusters", ylab = "Weighted Kappa value")
print(wk1)

plot(wk2,main = "Hcluster Single vs iris real", xlab = "Number of Clusters", ylab = "Weighted Kappa value")
print(wk2)
plot(wk3,main = "Hcluster Complete vs iris real", xlab = "Number of Clusters", ylab = "Weighted Kappa value") 
print(wk3)


