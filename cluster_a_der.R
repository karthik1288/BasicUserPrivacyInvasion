library(tm)
file <- "app_table.txt" 
mydata = read.table(file)
print (mydata)
# listwise deletion of missing
mydata <- na.omit(mydata) 
print (mydata)
# standardize variables
mydata <- scale(mydata) 
print (mydata)
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:5) wss[i] <- sum(kmeans(mydata, centers=i)$withinss)
print (mydata)
plot(1:5, wss, type="b", xlab="Number of Clusters",ylab="Within groups sum of squares")
# K-Means Cluster Analysis
fit <- kmeans(mydata, 5) # 5 cluster solution
print (mydata)
# get cluster means 
aggregate(mydata,by=list(fit$cluster),FUN=mean)
print (mydata)
# append cluster assignment
mydata <- data.frame(mydata, fit$cluster)
print (mydata)
print (fit$cluster)
# Ward Hierarchical Clustering
d <- dist(mydata, method = "euclidean") # distance matrix
fit <- hclust(d, method="ward") 
print (mydata)
plot(fit) # display dendogram
groups <- cutree(fit, k=5) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters 
rect.hclust(fit, k=5, border="red")
plot(fit)

