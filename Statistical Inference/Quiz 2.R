Question 1
What is the variance of the distribution of the average an IID draw of n observations from a population with mean μ and variance σ2.
Your Answer        	Score	Explanation
σ2			
σ/n			
2σ/n‾‾√	
σ2/n
Answer: σ2/n

Question 2
Suppose that diastolic blood pressures (DBPs) for men aged 35-44 are normally distributed with a mean of 80 (mm Hg) and a standard deviation of 10. About what is the probability that a random 35-44 year old has a DBP less than 70?
16%
8%			
22%			
32%		
Answer: pnorm(70,mean=80,sd=10): 16%

Question 3
Brain volume for adult women is normally distributed with a mean of about 1,100 cc for women with a standard deviation of 75 cc. What brain volume represents the 95th percentile?
approximately 1223
approximately 1247			
approximately 1175			
approximately 977

Answer: qnorm(0.95, mean = 1100, sd = 75): approximately 1223

Question 4
Refer to the previous question. Brain volume for adult women is about 1,100 cc for women with a standard deviation of 75 cc. Consider the sample mean of 100 random adult women from this population. What is the 95th percentile of the distribution of that sample mean?
approximately 1112 cc
approximately 1110 cc			
approximately 1115 cc			
approximately 1088 cc

Answer: 1112cc

Question 5
#You flip a fair coin 5 times, about what's the probability of getting 4 or 5 heads?
19%
3%			
6%			
12%			
Answer: 19% (dbinom(4,5,0.5)? don't know what the code hsould be')

Question 6
The respiratory disturbance index (RDI), a measure of sleep disturbance, for a specific population has a mean of 15 (sleep events per hour) and a standard deviation of 10. They are not normally distributed. Give your best estimate of the probability that a sample mean RDI of 100 people is between 14 and 16 events per hour?
68%
95%			
34%			
47.5%
Answer: 68%

Question 7
Consider a standard uniform density. The mean for this density is .5 and the variance is 1 / 12. You sample 1,000 observations from this distribution and take the sample mean, what value would you expect it to be near?
0.75
0.10			
0.25			
0.5		
Answer: 0.5. it just converges to the mean of the population (0.5)


Question 8
#The number of people showing up at a bus stop is assumed to be Poisson with a mean of 5 people per hour. You watch the bus stop for 3 hours. About what's the probability of viewing 10 or fewer people?
0.03
0.08			
0.12			
0.06		
Answer: ppois(10,5*3): 0.12