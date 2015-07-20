Question 1
Consider the following data with x as the predictor and y as as the outcome.

x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
Give a P-value for the two sided hypothesis test of whether β1 from a linear regression model is 0 or not.

0.025
0.391
0.05296
2.325

Answer: summary(lm(y~x))
Answer: 0.05296

Question 2
Consider the previous problem, give the estimate of the residual standard deviation.

0.4358
0.3552
0.223
0.05296

Answer: summary(lm(y~x))
Read from the residual standard error line: 0.223 on 7 df

Answer: ?

Question 3
In the mtcars data set, fit a linear regression model of weight (predictor) on mpg (outcome). 
Get a 95% confidence interval for the expected mpg at the average weight. What is the lower endpoint?

-4.00
21.190
-6.486
18.991

Answer: fit2 <- lm( mpg ~ wt, data = mtcars)
sum <- summary(fit2)$coefficients
(mean(mtcars$wt)*sum[2,1]+sum[1,1]) + c(-1,1) * qt(.975,df=fit2$df) * sum[2,2]

Answer: Can't get the number right, but probably 18.991.

Question 4
Refer to the previous question. Read the help file for mtcars. What is the weight coefficient interpreted as?

#It can't be interpreted without further information
#The estimated 1,000 lb change in weight per 1 mpg increase.
#The estimated expected change in mpg per 1,000 lb increase in weight.
#The estimated expected change in mpg per 1 lb increase in weight.

Answer: #The estimated expected change in mpg per 1,000 lb increase in weight.

Question 5
Consider again the mtcars data set and a linear regression model with mpg as predicted by weight (1,000 lbs). A new car is coming weighing 3000 pounds. Construct a 95% prediction interval for its mpg. What is the upper endpoint?

21.25
-5.77
14.93
27.57

Answer: (3*sum[2,1]+sum[1,1] + qt(.95, df=fit2$df)*sum[2,2])
        
        27.57 but why?

Question 6
Consider again the mtcars data set and a linear regression model with mpg as predicted by weight (in 1,000 lbs). A “short” ton is defined as 2,000 lbs. Construct a 95% confidence interval for the expected change in mpg per 1 short ton increase in weight. Give the lower endpoint.

-12.973
-6.486
-9.000
4.2026


Question 7
If my X from a linear regression is measured in centimeters and I convert it to meters what would happen to the slope coefficient?

It would get divided by 100
It would get divided by 10
It would get multiplied by 100.
It would get multiplied by 10

Answer: It would get multiplied by 100.

Question 8
I have an outcome, Y, and a predictor, X and fit a linear regression model with Y=β0+β1X+ϵ to obtain β^0 and β^1. What would be the consequence to the subsequent slope and intercept if I were to refit the model with a new regressor, X+c for some constant, c?
The new intercept would be β^0−cβ^1
The new intercept would be β^0+cβ^1
The new slope would be cβ^1
The new slope would be β^1+c

Question 9
Refer back to the mtcars data set with mpg as an outcome and weight (wt) as the predictor. About what is the ratio of the the sum of the squared errors, ∑ni=1(Yi−Y^i)2 when comparing a model with just an intercept (denominator) to the model with the intercept and slope (numerator)?

0.25
0.75
0.50
4.00

Answer: 0.25, but why

Question 10
Do the residuals always have to sum to 0 in linear regression?
The residuals never sum to zero.
If an intercept is included, then they will sum to 0.
The residuals must always sum to zero.
If an intercept is included, the residuals most likely won't sum to zero.

Answer: If an intercept is included, then they will sum to 0.