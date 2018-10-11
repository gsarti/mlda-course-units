vignette(package = "ggplot2")
fiboancci <- c(1, 1, 2, 3, 5)
fibonacci[fibonacci%%2 == 0]
fibonacci[!fibonacci%%2 == 0]
daily_show <- read.csv("daily_show_guests.csv", skip=4)
summary(daily_show[ , c(1,2)])

#The Binomial Distribution
par(mfrow=c(1,2), pty="s", pch=20)
plot(0:20, dbinom(0:20, 20, 0.2), xlab= "x", ylab = "f(x)")
plot(0:50, dbinom(0:50, 50, 0.5), xlab= "x", ylab = "f(x)")
