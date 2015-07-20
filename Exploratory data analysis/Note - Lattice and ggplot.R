
library(ggplot2)
# EXPLORATORY DATA ANALYSIS

# Week 1 lecture - Base plotting system
# Two phases - initiaize a new plot; then annotate (add to) existing plot
# Open graphics device:
x <- rnorm(10); y <- rnorm(10)
plot(x,y)
hist(x)

# Week 2 lecture - Lattice
# For high density graphics - create and annotate plot in one single function call
#xyplot()
#bwplot()
#histogram()
#stripplot()
#dotplot()
#splom()
#levelplot()
#contourplot()

#xyplot requires a formula; separated by | condition
library(lattice)
library(datasets)
xyplot(Ozone~Wind, data = airquality)

# a more complex lattice plot - convert a variable to a factor variable and plot by the factor
# Multidimensional panel from a single call
library(datasets)
library(lattice)
airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

# Calling a custom panel function in lattice
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c ("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2,1)) 
## Building the panel with addl lines
xyplot(y ~ x | f, panel = function(x,y,...){
        panel.xyplot(x,y,...)
        panel.abline(h = median (y), lty= 2)
        panel.lmline(x,y,col = 2)
        })


## GG PLOT (Grammar of Graphics by Wilkinson)
#qplot() # Quick plotting function
#ggplot() # Main plotting function
# Factors are used to indicate subsets of data and should be labeled

# A simple qplot (scatter)
require(ggplot2)
str(mpg)
qplot(displ,hwy,data=mpg)

# Modifying aesthetics (mapping color to drv)
qplot(displ,hwy,data=mpg, color = drv)

##### Adding summary of plotting####
# Line and shade are smoothing and 95% confidence, using LOESS
qplot(displ, hwy, data = mpg, geom=c("point","smooth"))
# Linear regressiondata:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAJCAYAAADgkQYQAAAAMElEQVR42mNgIAXY2Nj8x8cHC8AwMl9XVxe3QqwKcJmIVwFWhehW4LQSXQCnm3ABAHD6MDrmRgfrAAAAAElFTkSuQmCC
qplot(displ, hwy, data = mpg, geom=c("point","smooth"), method = "lm", facets = .~class)

### Histogram by specifying only one variable
qplot(hwy, data = mpg, fill = drv)

## Density plot by adding geom = "density

qplot(hwy, data = mpg, geom="density", color = drv)

## FACETS (like panels in lattice)
qplot(displ, hwy, data = mpg, facets = .~drv)   # Specific facet variable
# Facet takes variable on left hand side and right hand side (row and column) separated by tilde ~
# . specifies all variables (no variable on left)
qplot(hwy, data = mpg, facets = .~drv, binwidth = 2)


### GG PLOT - To recreate the qplot graphs in GG plot, you have to specify the aesthetics and geometries manually
g <- ggplot(mpg, aes(displ, hwy)) # Define aesthetics
g + geom_point() # Plot points
g + geom_point() + geom_smooth() # Add smooth loess
g + geom_point() + geom_smooth(method= "lm") # add linear 

# Add facets
g + geom_point() + geom_smooth(method= "lm") + facet_grid( .~ manufacturer)



################# A MORE COMPLEX GGPLOT ##############
g <- ggplot(mmacs, aes(logpm25, NocturnalSympt))

g + geom_point(alpha = 1/3) # transparent points
        + facet_wrap(bmicat ~ no2dec, nrow = 2 , ncol = 4) # make panels
        + geom_smooth(method = "lm", se = FALSE, col="steelblue") # add smoother and remove confidence levels
        + theme_bw(base_family = "Avenir", base_size = 10) # change theme and font
        + labs(x = expression ("log " * PM[2.5])) # Add labels
        + labs(y = "Nocturnal Symptoms")
        + labs(title = "MAACS Cohort")