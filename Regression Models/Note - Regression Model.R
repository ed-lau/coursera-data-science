
##################### 
#Regression model, using the diamond dataset (predicting diamond price from size) in the UsingR package
#####################

require(UsingR)
require(ggplot2)
g = ggplot(diamond, aes(x=carat, y = price),)
g = g + xlab("Mass (carets)")
g = g + ylab("Price (Sin$)")
g = g + geom_point(size = 6, colour = "black", alpha = 0.2)
g = g + geom_point(size = 5, colour = "blue", alpha = 0.2)
g = g + geom_smooth(method = "lm", colour = "black")
g

# Fitting the linear regresison model
fit <- lm(price ~ carat, data = diamond)
coef(fit)
summary(fit)

# This estimates an expected $3721.02) increase for every carat increase in the mass of the dimaond


# Getting a mroe itnerpretable intercept
fit2 <- lm(price ~ I(carat-mean(carat)), data = diamond)
coef(fit2)

# $500 is the expected price for the average size of a diamond (0.2 carat); the slope stays the same.

# Changing the scale (if you multiply carat size by 10, the slope becomes 10x smaller)
fit3 <- lm(price ~ I(carat*10), data = diamond)
summary(fit3)

###############################################
# Using the fitted line to make regressions with new values
# Predicting the price of some diamonds...
###############################################

newx <- c(0.16, 0.27, 0.34)
coef(fit)[1] + coef(fit)[2] * newx
predict(fit, newdata = data.frame(carat = newx))

###############################################
# Generating a residual plot
###############################################

data(diamond)
y <- diamond$price
x <- diamond$carat
fit <- lm(y~x)
n <- length(y)
e <- resid(fit)
yhat <- predict(fit)
max(abs(e-(y - yhat)))  # residul e basically is y - y hat
sum(e) # sum of residuals is 0

# plotting residuals vs. X
plot(x, e, xlab = "Mass (carats)", ylab = "Residuals (SIN$)", bg = "lightblue", col = "black", cex = 1.1, pch = 21, frame = FALSE)
abline(h = 0, lwd = 2)
for (i in 1:n) {lines(c(x[i], x[i]), c(e[i],0), col= "red", lwd = 2)}


########## INFERENCE OF REGRESSION #################
# Getting confidence interval

summary(fit)
# Confidence interval for intercept and for slope

sumCoef <- summary(fit)$coefficients
sumCoef[1,1] + c(-1,1) * qt(.975, df = fit$df) * sumCoef[1,2] # conf interval for intercept
sumCoef[2,1] + c(-1,1) * qt(.975, df = fit$df) * sumCoef[2,2] # conf interval for slope

# What this means is that we estimated a one caret increase in diamond size will result in
# $3556 to 3885 $ increase in value



#####################
#PREDICTION
#####################

library(ggplot2)
newx = data.frame(x = seq(min(x), max(x), length = 100))
# There are two different intervals you could predict (confidence range of where the points are, and prediction of the line)
p1 = data.frame(predict(fit, newdata = newx, interval = ("confidence")))
p2 = data.frame(predict(fit, newdata = newx, interval = ("prediction")))

p1$interval = "confidence"
p2$interval = "prediction"
p1$x = newx$x
p2$x = newx$x
dat = rbind(p1,p2)
names(dat)[1] = "y"

g = ggplot(dat, aes(x=x, y=y))
g = g + geom_ribbon(aes(ymin = lwr, ymax = upr, fill = interval), alpha = 0.2)
g = g + geom_line()
g = g + geom_point(data = data.frame(x=x, y=y), aes(x=x, y=y), size = 4)
g