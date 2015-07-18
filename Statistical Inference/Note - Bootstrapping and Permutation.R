######## Bootstrapping example ########
# Re-draw from sample to get estimate of distribution

library(UsingR)
data(father.son)
x <- father.son$sheight
n <- length(x)
B <- 10000

# Making a matrix of B by n, containing n*B resamples of the data x
resamples <- matrix(sample(x, n*B, replace = TRUE), B, n)

# Getting the median of each of the resmapling
resampleMedians <- apply(resamples, 1, median)

qplot(resampleMedians)

# Get the standard deviation of the resampled medians
sd(resampleMedians)

# Get the confidence interval
quantile(resampleMedians)


############# PERMUTATION TESTS ##################
data(InsectSprays)
boxplot(count ~ spray, data = InsectSprays)
subdata <- InsectSprays[InsectSprays$spray %in% c("B", "C"), ] 
y <- subdata$count

# Group by category (insect spray type)
group <- as.character(subdata$spray)
testStat <- function(w, g) mean(w[g == "B"]) - mean(w[g == "C"])
observedStat <- testStat(y, group)
permutations <- sapply(1:10000, function(i) testStat(y, sample(group))) 
observedStat

# How often do your permutations exhibit more extreme stats thant he actual observation? (0% here)
mean(permutations > observedStat)

