Question 1
Consider influenza epidemics for two parent heterosexual families. 
Suppose that the probability is 17% that at least one of the parents has contracted the disease. 
The probability that the father has contracted influenza is 12% 
while the probability that both the mother and father have contracted the disease is 6%. 
What is the probability that the mother has contracted influenza?

(Hints look at lecture 2 around 5:30 and homework question on page 3/10).

6%
11%
5%
17%

Answer: 11%

Question 2
A random variable, X is uniform, a box from 0 to 1 of height 1. 
(So that its density is f(x)=1 for 0≤x≤1.) What is its 75th percentile? 

(Hints, look at lecture 2 around 21:30 and homework 1 page 4/10. Also, look up the help function for the qunif command in R.)

0.75
0.50
0.10
0.25

Answer: 0.75

Question 3
You are playing a game with a friend where you flip a coin and if it comes up heads you give her X dollars and if it comes up tails she gives you Y dollars. The probability that the coin is heads is p (some number between 0 and 1.) What has to be true about X and Y to make so that both of your expected total earnings is 0. The game would then be called “fair”. 

(Hints, look at Lecture 4 from 0 to 6:50 and Homework 1 page 5/10. Also, for further reading on fair games and gambling, start with the Dutch Book problem ).

p/1−p=Y/X
p/1−p=X/Y
X=Y
p=X/Y

Answer:  p/1-p = Y/X

Question 4
A density that looks like a normal density (but may or may not be exactly normal) 
is exactly symmetric about zero. (Symmetric means if you flip it around zero it 
                                 looks the same.) What is its median? 

(Hints, look at quantiles from Lecture 2 around 21:30 and the problem on page 9/10 from Homework 1.)

The median must be 0.
The median must be different from the mean.
The median must be 1.
We can't conclude anything about the median.

Answer: The median must be 0.


Question 5
Consider the following PMF shown below in R

x <- 1:4
p <- x/sum(x)
temp <- rbind(x, p)
rownames(temp) <- c("X", "Prob")
temp

##      [,1] [,2] [,3] [,4]
## X     1.0  2.0  3.0  4.0
## Prob  0.1  0.2  0.3  0.4
What is the mean? 

(Hint, watch Lecture 4 on expectations of PMFs and look at Homework 1 problem on page 10/10 for a similar problem calculating the variance.)

4
2
1
3

Answer: 3


Question 6:
Question 6
A web site (www.medicine.ox.ac.uk/bandolier/band64/b64-7.html) for home pregnancy tests cites the following: 
“When the subjects using the test were women who collected and tested their own samples, 
the overall sensitivity was 75%. Specificity was also low, in the range 52% to 75%.” 
Assume the lower value for the specificity. 
Suppose a subject has a positive test and that 30% of women taking pregnancy tests are actually pregnant. 
What number is closest to the probability of pregnancy given the positive test?



(Hints, watch Lecture 3 at around 7 minutes for a similar example. 
Also, there's a lot of Bayes' rule problems and descriptions out there, for example here's one for HIV testing. 
Note, discussions of Bayes' rule can get pretty heady. So if it's new to you, stick to basic treatments of the problem. 
Also see Homework 2 question on page 5/12.)
20%
30%
40%
10%

Answer: P(Preg|+)=P(+|Preg)P(Preg)P(+|Preg)P(Preg)+P(+|Pregc)P(Pregc)=.75×.30.75×.30+(1−.52)×(1−.3)≈0.40
