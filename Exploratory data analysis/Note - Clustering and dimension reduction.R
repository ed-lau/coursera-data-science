##### WEEK 3 LECTURE - Clustering and dimensionality reduction
# Principles of clustering - find things that are close together

set.seed(1234)
par(mar = c(0,0,0,0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x,y, col= "blue", pch = 19, cex = 2)
text (x + 0.05, y + 0.05, labels = as.character(1:12))

#Step 1: Calculate pairwise distance between points
dataFrame <- data.frame (x=x, y-y)
dist(dataFrame)

#Step 2 - Create the cluster dendrogram
dataFrame <- data.frame (x=x, y-y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
plot(hClustering)

#Step 3 - Cut the tree at particular points to determine the number of clusters

#########################
# Determine linkage (how to detemrine position of super point after merging two points or two cluster)
# Average - gives you center of gravity distance between two coordinates
# Complete - gives you farthest distance between two clusters

# Step 4 - Heat map function
dataFrame <- data.frame(x=x, y=y)
set.seed(143)
dataMatrix <-as.matrix(dataFrame)[sample(1:12),]
heatmap(dataMatrix)


################ K- MEANS CLUSTERING ##################
# Need to define how close two things are to be considered close to each other
# Pick a distance/ similarity that makes sense for your problem

# K Means clustering - a partitioning approach into a fixed number of clusters
set.seed(1234) 
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)

dataFrame <- data.frame(x,y)
kmeansObj <- kmeans(dataFrame, centers = 3)
names(kmeansObj)
kmeansObj$cluster

par(mar = rep(0.2, 4))
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 3, lwd = 3)

##### Visualization with heatmap

set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ] 
kmeansObj2 <- kmeans(dataMatrix, centers = 3)
par(mfrow = c(1, 2), mar = c(2, 4, 0.1, 0.1)) 
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")


## DIMENSION REDUCTION

# Create a pattern first:
dataMatrix <- matrix(rnorm(400), nrow = 40)
set.seed(678910)
for (i in 1:40){
        coinFlip1 <- rbinom(1,size=1,prob=0.5)
        coinFlip2 <- rbinom(1,size=1,prob=0.5)
        if (coinFlip1){
                dataMatrix[i,] <-dataMatrix[i,] + rep(c(0,5),each=5)
        }
        if (coinFlip2){
                dataMatrix[i,] <-dataMatrix[i,] + rep(c(0,5),5)
        }
}

# Clustering here
hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order,]

svd2 <-svd(scale(dataMatrixOrdered))
par(mfrow = c(1,3))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(svd2$v[,1],pch=19,xlab="Column",ylab="First right singular vector")
plot(svd2$v[,2],pch=19,xlab="Column",ylab="Second right singular vector")
plot(svd2$d,ylab="Singular value")
plot(svd2$d^2/sum(svd2$d^2), ylab="Percent of variance explained")


######## DEALING WITH MISSING VALUES FOR SVD
require(impute)
dataMatrix 2 <- dataMatrixOrdered
dataMatrix2[sample(1:100,size=40,replace=FALSE)] <- NA
dataMatrix2 <-impute.knn(dataMatrix2)$data
svd1 <- svd(scale(dataMatrixOrdered))
svd2 <- svd(scale(dataMatrix2))
par(mfrow=c(1,2))
plot(svd1$v[,1],pch=19)
plot(svd2$v[,1],pch=19])
