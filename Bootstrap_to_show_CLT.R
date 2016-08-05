library(ggplot2)
library(stats)
library(utils)
suppressPackageStartupMessages(library(googleVis))

# Sample Data

x <- c(187, 169, 123, 166, 199, 127, 159, 155, 145, 142, 171)
y <- c(122, 45, 98, 38, 148, 179, 193, 54, 22, 245)

n1 <- length(x)
n2 <- length(y)

# Set number of Simulations 
k <- 10000

# define seed number such that the following computations can be replicated or reproduced
set.seed(1234)

# Simulate or Bootstrap with replacement by repliocating from k samples of n1 & n2 normal 
# distributions with the right mean and variance 
# Also called the Parametric Bootstrap

simXsample <- replicate(k, rnorm(n1, mean(x), sd(x)))
simYsample <- replicate(k, rnorm(n2, mean(x), sd(x)))

# Compute mean differences of the n1 & n2 simulated observations k times

simMeanDifs <- apply(simXsample, 2, mean) - apply(simYsample, 2, mean)

# find the two relevant quantiles of k simulated mean differences
# i.e. 95% CI 
quantile(simMeanDifs, c(0.025 , 0.975))

# Plot
hist(simMeanDifs, col = c("green"))


#Histo <- gvisHistogram(data.frame(simMeanDifs), options = list(title = "ABC", legend = "{ position: 'none' }", colors = "['green']"), chartid = "a")
#plot(Histo)
## http://127.0.0.1:23979/custom/googleVis/a.html


         ####################################################################
         
         # if we use rexp() function instead of rnorm that signifies that 
         # our the differences or any other function derived from x & y (eg. area) 
         # is non-linear, in which case the confidence interval could be computed
         # with different approaches :
         # 1) simulation
         # 2) analytical
         # 3) theoretical derivations
         
         # these being computationally intensive , we use simulation here:
         ########++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
         
         # Call Center waiting times on 2 different days. We want to know if there 
         # is material difference in response time over these 2 sample days with 
         # small sample available. Also , for one of the days, fewer observations 
         # are available.
         # For random time observations, an exponential distribution is the best 
         # applicable :
         
         Day1Waiting <- c(23.6, 42.9, 53.4, 73.4, 1.6, 2.4, 13.6, 2.1)
         Day2Waiting <- c(15.6, 34.5, 67.0, 89.0, 2.4, 1.8, 16.4)
         Day3Waiting <- c(155.6, 347.5, 678.0, 893.0, 233.4, 134.8, 167.4)
         
         L1 <- length(Day1Waiting)
         L2 <- length(Day2Waiting)
         L3 <- length(Day3Waiting)
         
         lambda1 <- 1 / mean(Day1Waiting)
         lambda2 <- 1/ mean(Day2Waiting)
         
         simXsample_exp <- replicate(k, rexp(L1, lambda1))
         simYsample_exp <- replicate(k, rexp(L2, lambda2))
         
         # Compute mean differences of n1 & n2 simulated observations k times:
         
         simExpMeanDifs <- apply(simXsample_exp, 2, mean) - apply(simYsample_exp, 2, mean)
         
         # find the two relevant quantiles of k simulated mean differences
         
         
         quantile(simExpMeanDifs, c(0.025,0.975))    # i.e. 95% Confidence Interval
         quantile(simExpMeanDifs, c(0.005,0.995))    # i.e. 99% Confidence Interval
         
         
         # Plot
         
         hist(simExpMeanDifs, col="blue", nclass=150)
         ##################################################################################
         
         
         
         # Non-parametric bootstrap
         
         NPsimXsample <- replicate(k, sample(Day1Waiting, replace = TRUE))
         NPsimYsample <- replicate(k, sample(Day2Waiting, replace = TRUE))
         
         # Compute mean differences of n1 & n2 simulated observations k times:
         
         NPsimMeanDifs <- apply(NPsimXsample, 2, mean) - apply(NPsimYsample, 2, mean)
         
         # find the two relevant quantiles of k simulated mean differences
         
         
         quantile(NPsimMeanDifs, c(0.025,0.975))    # i.e. 95% Confidence Interval
         
         
         
         # Variation on day3: 95% CI indicates that the 2 samples are very different;
         # however we have shown here a bootstrap that does not assume any distribution
         # or is non-parametric and the simulation with replacement is used to confirm 
         # the mean difference
         
         NPsimXsample <- replicate(k, sample(Day1Waiting, replace = TRUE))
         NPsimYsample2 <- replicate(k, sample(Day3Waiting, replace = TRUE))
         
         # Compute mean differences of n1 & n2 simulated observations k times:
         
         NPsimMeanDifs1vs3 <- apply(NPsimXsample, 2, mean) - apply(NPsimYsample2, 2, mean)
         
         # find the two relevant quantiles of k simulated mean differences
         
         
         quantile(NPsimMeanDifs1vs3, c(0.025,0.975))    # i.e. 95% Confidence Interval
         
    #### The above 3 variations and respective 95% CI all illustrate CLT
    #### I could have used the "for loop and histogram plots" to create a
    #### similar deduction, but there are several such examples already available
    #### from other web sources.
         