vignette(package = "ggplot2")
fiboancci <- c(1, 1, 2, 3, 5)
fibonacci[fibonacci%%2 == 0]
fibonacci[!fibonacci%%2 == 0]
daily_show <- read.csv("daily_show_guests.csv", skip=4)
summary(daily_show[ , c(1,2)])

#The Binomial Distribution

#mfrow allows us to specify the shape of the graph matrix
#(in this case 2,2, four graphs on two rows)
#Pty specifies the type of graph, in this case s = squared
#Pch specifies the kind of point to be represented. 20 is a circle
par(mfrow=c(2,2), pty="s", pch=20)

#The first argument represent the vector of quantiles
#The second argument represents the number of trials
#The third argument represents the probability of success
plot(0:20, dbinom(0:20, 20, 0.2), xlab= "x", ylab = "f(x)")
title(main="Binomial Distribution")
plot(0:50, dbinom(0:50, 50, 0.5), xlab= "x", ylab = "f(x)")
title(main="Binomial Distribution")

#The Poisson Distribution

#the first argument represent the number of trials
#the second parameter represent the mean of dpois (lambda)
plot(0:20, dpois(0:20, 5), xlab= "x", ylab = "f(x)")
title(main="Poisson Distribution")
plot(0:50, dpois(0:50, 10), xlab= "x", ylab = "f(x)")
title(main="Poisson Distribution")

#The Normal Distribution

par(mfrow=c(1,1), pty="s", pch=20)

#Generates a sequence from p1 to p2 with length l or by a step
xx <- seq(-10, 10, l=1000)

#The first argument is the vector of quantiles
#The second argument is the mean
#The thirs argument is the standard deviation
plot(xx, dnorm(xx, 0, 0.5), xlab = "x", ylab = "f(x)", type = "l")

#Lines add graphical output on a pre-existing plot
lines(xx, dnorm(xx, 5, 1), col = 2)
lines(xx, dnorm(xx, 0, 1), col = 3)
lines(xx, dnorm(xx, 0, 2), col = 4)

#The Khi-square distribution

xx <- seq(0, 40, l=1000)

#The second parameter is the degrees of freedom
plot(xx, dchisq(xx, 5), xlab = "x", ylab = "f(x)", type = "l")
lines(xx, dchisq(xx, 10), col = 2)
lines(xx, dchisq(xx, 20), col = 3)

#The F distribution

xx <- seq(0, 10, l=1000)

#The second and third parameters are the degrees of freedom
plot(xx, df(xx, 100, 5), xlab = "x", ylab = "f(x)", type = "l")
lines(xx, df(xx, 5, 10), col = 2)
lines(xx, df(xx, 5, 40), col = 3)

#The t distribution

xx <- seq(-5, 5, l=1000)

#The second parameter is the degrees of freedom
plot(xx, dnorm(xx, 0, 1), xlab = "x", ylab = "f(x)", type = "l")
lines(xx, dt(xx, 20), col = 2)
lines(xx, dt(xx, 5), col = 3)
lines(xx, dt(xx, 1), col = 4) #Cauchy distribution

#Uniform transformation

x <- rnorm(10^5) #simulate 10 000 values for a standard normal by default
xx <- seq(min(x), max(x), l = 1000)
hist.scott(x, main= "") #from MASS package, automatically divides the histogram into 
lines(xx, dnorm(xx), col = 2, lwd = 2)

u <- pnorm(x) #Uniform transformation, Cumulative distribution function of x
hist.scott(u, main="")
#segments(0, 1, 1, 1, col=2, lwd=2) #creates a segment going from (0,1) to (1,1)
#add parameter is a bool which specifies if the curve should be added to an existing plot
curve(dunif(x), from=0, to=1, col=2, lwd=2, add=T) 

# Quantile function
x <- seq(-3, 13, l=1000) #centered around 5, with +- 8 range
par(mfrow=c(1,2), pty="s", pch=20)
#Cumulative distribution function of Normal distribution on x
plot(x, pnorm(x, 5, 2), xlab = "x", ylab = "f(x)", type = "l")
p <- seq(0,1, l=1000)
#Quantile distribution function of Normal distribution on x
plot(p, qnorm(p, 5, 2))


#Inversion sampling

par(mfrow=c(1,2), pty = "s", pch=20)
u <- runif(10^4)
y <- qnorm(u, m = 5, s = 2)
qqnorm(y, main = "")
qqline(y)
hist.scott(y, main="")
lines(sort(y), dnorm(sort(y), 5, 2), col=2, lwd=2) #We have to sort y in order to plot the right normal distr. function

#Joint distribution simulation
par(mfrow=c(1,1), pty = "s", pch=20)
x <- rbinom(10^5, size = 1, prob = 0.7)
y <- rnorm(10^5, m = x * 5, s = 1) ### Y| X = x ~ N(x * 5, 1)
hist.scott(y, main = "", xlim = c(-4, 10))

xx <- seq(-4, 10, l = 1000)
ff <- 0.3 * dnorm(xx, 0) + 0.7 * dnorm(xx, 5)
### This is a mixture of normal distributions
hist.scott(y, main = "", xlim = c(-4, 10))
lines(xx, ff, col = "red", lwd = 2)

# CLT exercise

n <- c(5, 10, 50)
p <- c(0.1,0.5,0.9)
par(mfrow=c(3,3), pty = "s", pch=20)
for(j in 1:3){
  for (i in 1:3){
    mean <- n[j]*p[i]
    variance <- n[j]*p[i]*(1-p[i])
    x <- seq(floor(mean - 4 * sqrt(variance)), floor(mean + 4 * sqrt(variance)), 1)
    plot(x, dbinom(x, n[j], p[i]))
    lines(dnorm(x, mean, sqrt(variance)), col=2, lwd=2)
  }
}
