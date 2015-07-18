# This case study will perform some exploratory analysis on the EPA PM2.5 datasets
# from 1999 and from 2012, to ask whether air pollutions decreased.
# Set directory
setwd("/Users/edwardlau/Documents/Ping Lab/R Projects/coursera-data-science/Exploratory data analysis/EPA Air Poullation Case Study/")
dir()
# Open  the 1999 files
pm0 <- read.table("RD_501_88101_1999-0.txt", comment.char="#", header = FALSE, sep = "|", na.strings="")
dim(pm0)

# Read the first line as column names
cnames <- readLines("RD_501_88101_1999-0.txt", 1)
cnames
cnames <- strsplit(cnames,"|", fixed=TRUE)
cnames
names(pm0) <- make.names(cnames[[1]]) # The make.name function takes an arbitrary string and make it a valid column name without spaces etc.
head(pm0)

# Take out the Sample.Value column with the PM2.5 readings.
x0 <- pm0$Sample.Value
class(x0)
str(x0)
# Five-number summary
summary(x0)


# Open the 2012 file
pm1 <- read.table("RD_501_88101_2012-0.txt", comment.char="#", header = FALSE, sep = "|", na.strings="")
dim(pm1)
names(pm1) <- make.names(cnames[[1]])

# Take out the Sample.Value column with the PM2.5 readings.
x1 <- pm1$Sample.Value
class(x1)
str(x1)
# Five-number summary
summary(x1)
summary(x0)
# Here you start to notice some lower average in 2012 ...

# The data is also more complete.
mean(is.na(x1))
mean(is.na(x0))

# Plot out x0 vs. x1 (but the data are too squished out to see anything)
boxplot(x0,x1)

# Take a log to look at data on log scale ... lower average but higher spread.
boxplot(log10(x0),log10(x1))

# The negative values are unusual - since you cannot have negative air particle mass. 
# To investigate what is going on, pluck out the negative values and see what is going on.
negative <- x1 < 0
str(negative)
sum(negative, na.rm = TRUE)
mean(negative, na.rm = TRUE)

# Pull out the dates and see when the data collections occurred
dates <- pm1$Date
str(dates)
dates <- as.Date(as.character(dates), "%Y%m%d")
str(dates)
hist(dates, "month")# When did the collections occur?
hist(dates[negative],"month")# When did the negative values occur?
# Possibly there is less pollution to measure in the winter.


#### EXPLORE CHANGES OVER ONE MONITOR OVER TIME TO CORRECT FOR SOME BACKGROUNDS
# Subset the PM data
site0 <- unique(subset(pm0, State.Code == 36, c(County.Code, Site.ID)))
site1 <- unique(subset(pm1, State.Code == 36, c(County.Code, Site.ID)))

# Concatenate county code and site ID
site0 <- paste(site0[,1], site0[,2], sep = ".")
site1 <- paste(site1[,1], site1[,2], sep = ".")

# Get intersect between pm0 and pm 1
both <- intersect(site0, site1)

# How many observations are there in each monitor?
pm0$county.site <- with(pm0, paste(County.Code, Site.ID, sep="."))
pm1$county.site <- with(pm1, paste(County.Code, Site.ID, sep="."))

# Subset out the original data frame to contain only the shared monitors
cnt0 <- subset(pm0, State.Code == 36 & county.site %in% both)
cnt1 <- subset(pm1, State.Code == 36 & county.site %in% both)

# Split the data frame into individual monitors to look at how many observations there are
sapply(split(cnt0, cnt0$county.site), nrow)
sapply(split(cnt1, cnt1$county.site), nrow)

# Pick out county 63 and monitor 2008
pm0sub <- subset(pm0, State.Code == 36 & County.Code == 63 & Site.ID == 2008)
pm1sub <- subset(pm1, State.Code == 36 & County.Code == 63 & Site.ID == 2008)
dim(pm0sub)
dim(pm1sub)

# Trying to plot out the particulate level over time in the monitor
dates1 <-pm1sub$Date
dates1 <- as.Date(as.character(dates1),"%Y%m%d")
x1sub <- pm1sub$Sample.Value
str(dates1)
plot(dates1,x1sub)

dates0 <- pm0sub$Date
dates0 <- as.Date(as.character(dates0),"%Y%m%d")
x0sub <- pm0sub$Sample.Value
str(dates0)
plot(dates0,x0sub)
str(dates0)
plot(dates1, x1sub)

# Build a panel plot to plot both datasets together

rng <- range(x0sub, x1sub, na.rm=T) # Finding common range

par(mfrow = c(1,2), mar = c(4,4,2,1))
plot(dates0, x0sub, pch=20, ylim = rng)
abline(h=median(x0sub, na.rm=T))
plot(dates1, x1sub, pch=20, ylim = rng)
abline(h=median(x1sub, na.rm=T))


#### EXPLORING ON A STATE BY STATE BASIS - have individual states improved?
# Create a plot that contains state averages between 1999 and 2012 and connect the dots

# Take a sample value (average value) by state
mn0 <- with(pm0, tapply(Sample.Value, State.Code, mean, na.rm=T))
summary(mn0)
mn1 <- with(pm1, tapply(Sample.Value, State.Code, mean, na.rm=T))
summary(mn1)

# Create a data frame with name/ID of state and their PM2.5
d0 <- data.frame(state = names(mn0), mean = mn0)
d1 <- data.frame(state = names(mn1), mean = mn1)
mrg <- merge(d0,d1, by = "state")
dim(mrg)

# Plot out 1999 vs 2012 data by state and join the data by lines.
par(mfrow = c(1,1))
with(mpg, plot(rep(1999, 53), mrg[,2],xlim = c(1998, 2013)))
with(mpg, points(rep(2012, 53), mrg[,3],xlim = c(1998, 2013)))
segments(rep(1999,53),mrg[,2],rep(2012,53),mrg[,3])

