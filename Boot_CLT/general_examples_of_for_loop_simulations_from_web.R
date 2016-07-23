
library(ggplot2)
library(utils)
library(stats)


# setting constants
lambda <- 0.2   # exponential parameter
nsim <- 1000    # number of simulations
n <- 40         # number of points exponentially distributed

# seed for random simulation
set.seed(4)

# creating data "sim" and "sim_mean"
sim <- matrix(rexp(n * nsim, lambda), nrow=nsim, ncol=n)
sim_mean <- rowMeans(sim) # "rowMeans" is faster then "apply".


data_mean <- mean(sim_mean)
data_var <- var(sim_mean)
print(c(data_mean, data_var))


theory_mean <- 1/lambda
theory_var <- (1/lambda)^2/n
print(c(theory_mean, theory_var))


data <- data.frame(sim_mean);
plot <- ggplot(data, aes(x=sim_mean))
plot <- plot + geom_histogram(aes(y=..density..), colour="black", fill="cyan", binwidth=0.2) +
  labs(title="Density distribution of 40 means", x="Means", y="Density")  
print(plot)




plot2 <- ggplot(data, aes(x=sim_mean, colour=Distributions));
plot2 <- plot2 + geom_histogram(aes(y=..density.., colour = "Data"),
                                fill= "lightcyan3", binwidth=0.2) +
  # Theoretical (red) and Simulated mean (green)
  geom_vline(xintercept=theory_mean, colour="red",   linetype="dashed", size=1) +
  geom_vline(xintercept=data_mean,   colour="green", linetype="dashed", size=1) +
  # Normal distribution with mean/variance Theoretical (red) and Simulated (green)
  stat_function(fun=dnorm, args=list(mean=theory_mean, sd=sqrt(theory_var)),
                aes(colour = "Theoretical"), size = 1.0) +
  stat_function(fun=dnorm, args=list(mean=data_mean, sd=sqrt(data_var)),
                aes(colour = "Simulated"), size = 1.0) +
  # Title,labels and legend
  scale_colour_manual(values = c("lightseagreen", "red", "green")) +
  labs(title="Comparison between simulated and theoretical data", x="Means", y="Density")  
print(plot2)

