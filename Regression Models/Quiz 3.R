###
Question 1
Consider the mtcars data set. 
Fit a model with mpg as the outcome that includes number of cylinders as a factor variable and weight as confounder. 
Give the adjusted estimate for the expected change in mpg comparing 8 cylinders to 4.


-6.071
-3.206
-4.256
33.991

Answer: fit <- lm(formula = mpg ~ factor(cyl) + wt, data = mtcars); summary(fit)
Answer: -6.071

Question 2
Consider the mtcars data set. Fit a model with mpg as the outcome that includes number of cylinders as a factor 
variable and weight as a possible confounding variable. Compare the effect of 8 versus 4 cylinders on mpg for 
the adjusted and unadjusted by weight models. Here, adjusted means including the weight variable as a term in the regression model and unadjusted means the model without weight included. What can be said about the effect comparing 8 and 4 cylinders after looking at models with and without weight included?.

Including or excluding weight does not appear to change anything regarding the estimated impact of number of cylinders on mpg.
Holding weight constant, cylinder appears to have less of an impact on mpg than if weight is disregarded.
Holding weight constant, cylinder appears to have more of an impact on mpg than if weight is disregarded.
Within a given weight, 8 cylinder vehicles have an expected 12 mpg drop in fuel efficiency.

Answer: fit <- lm(formula = mpg ~ factor(cyl), data = mtcars); summary(fit)
Compare the intercepts with previous questions
Answer: Holding weight constant, cylinder appears to have less of an impact on mpg than if weight is disregarded.

Question 3
Consider the mtcars data set. Fit a model with mpg as the outcome that considers number of cylinders as a factor 
variable and weight as confounder. Now fit a second model with mpg as the outcome model that considers 
the interaction between number of cylinders (as a factor variable) and weight. 
Give the P-value for the likelihood ratio test comparing the two models and 
suggest a model using 0.05 as a type I error rate significance benchmark.
The P-value is small (less than 0.05). So, according to our criterion, we reject, which suggests that the interaction term is not necessary.
The P-value is small (less than 0.05). Thus it is surely true that there is an interaction term in the true model.
The P-value is larger than 0.05. So, according to our criterion, we would fail to reject, which suggests that the interaction terms may not be necessary.
The P-value is small (less than 0.05). So, according to our criterion, we reject, which suggests that the interaction term is necessary
The P-value is small (less than 0.05). Thus it is surely true that there is no interaction term in the true model.
The P-value is larger than 0.05. So, according to our criterion, we would fail to reject, which suggests that the interaction terms is necessary.

Answer: fit1 <- lm(mpg~factor(cyl) + wt, data=mtcars); fit2 <- lm(mpg~factor(cyl)*wt, data=mtcars)
anova(fit1, fit2)
Answer: The P-value is larger than 0.05. So, according to our criterion, we would fail to reject, which suggests that the interaction terms may not be necessary.


Question 4
Consider the mtcars data set. Fit a model with mpg as the outcome that includes number of cylinders as a factor variable and weight inlcuded in the model as

lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
How is the wt coefficient interpretted?

The estimated expected change in MPG per half ton increase in weight.
The estimated expected change in MPG per half ton increase in weight for for a specific number of cylinders (4, 6, 8).
The estimated expected change in MPG per one ton increase in weight for a specific number of cylinders (4, 6, 8).
The estimated expected change in MPG per one ton increase in weight.
The estimated expected change in MPG per half ton increase in weight for the average number of cylinders.

Answer: The estimated expected change in MPG per half ton increase in weight for for a specific number of cylinders (4, 6, 8).

Question 5
Consider the following data set

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
Give the hat diagonal for the most influential point

0.9946
0.2804
0.2287
0.2025

Answer: fit <- lm(y~x); hatvalues(fit)
Answer: 0.9946

Question 6
Consider the following data set

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
Give the slope dfbeta for the point with the highest hat value.

0.673
-.00134
-134
-0.378

Answer:  fit <- lm(y~x); dfbetas(fit)
Answer: -134?


Question 7
Consider a regression relationship between Y and X with and without adjustment for a third variable Z. Which of the following is true about comparing the regression coefficient between Y and X with and without adjustment for Z.
The coefficient can't change sign after adjustment, except for slight numerical pathological cases.
It is possible for the coefficient to reverse sign after adjustment. For example, it can be strongly significant and positive before adjustment and strongly significant and negative after adjustment.
Adjusting for another variable can only attenuate the coefficient toward zero. It can't materially change sign.
For the the coefficient to change sign, there must be a significant interaction term.

Answer: It is possible for the coefficient to reverse sign after adjustment. For example, it can be strongly significant and positive before adjustment and strongly significant and negative after adjustment.





