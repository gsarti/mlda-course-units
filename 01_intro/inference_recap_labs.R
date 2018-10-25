# Random simulation of normal distribution
par(mfrow=c(1,1), pty = "s", pch=20)
y <- (nhtemp - 32) / 1.8
plot(1912:1971, y, pch = 20, xlab = "Year", ylab = "y")

set.seed(2018); ysim <- rnorm(length(y), m = mean(y), s = sd(y))
points(1912:1971, ysim, col =2, pch = 20)

#Consistency of the sample mean

M <- 10^5; n <- c(10, 30, 100); y <- matrix(NA, M, 3)
for(j in 1:3) {
  for (i in 1:M) {
    y[i,j] <- mean(rpois(n[j], 1))
  }
}

par(mfrow=c(1,3), pty = "s", pch=20)

for (j in 1:3) {
  hist.scott(y[,j], xlim=c(0,2),main=paste("n = ", j*10)); abline(v=1, col=2)
}

# Efficiency of the sample mean

M <- 10^5; n <- 100; mat <- matrix(NA, nrow=M, ncol=2)
for (i in 1:M) {
  y <- rnorm(n, 5)
  mat[i,] <- c(mean(y), median(y))
}
par(mfrow=c(1,1), pty = "s", pch=20)
plot(density(mat[,1]), type="l", main="")
lines(density(mat[,2]), col="red")

# Robustness of the sample median

M <- 10^5; n <- 100; mat <- matrix(NA, nrow=M, ncol=2)
for (i in 1:M) {
  x <- rbinom(n, size=1, prob=0.9)
  y <- x * rnorm(n, 5) + (1 - x) * rnorm(x, 35)
  mat[i,] <- c(mean(y), median(y))
}
par(mfrow=c(1,1), pty = "s", pch=20)
plot(density(mat[,2]), type="l", main="", xlim=c(4, 13), col=2)
lines(density(mat[,1]), col=1)

# Confidence interval

M <- 10^5; n <- 10; mat <- matrix(NA, nrow=M, ncol=2)
for (i in 1:M) {
  y <- rnorm(n, 5)
  se_t <- sqrt(var(y)/n) * qt(0.975, n-1)
  mat[i,] <- mean(y) + se_t * c(-1, 1)
}

mean(mat[,1] < 5 & mat[,2] > 5)

# Visualizing confidence intervals

plot(rep(5,20), 1:20, pch = 16, ylab="Sample", xlab=expression(mu))
for (i in 1:20) segments(mat[i,1], i, mat[i,2], i)

# Approximate confidence intervals

M <- 10^5; n <- 10; mat <- matrix(NA, nrow=M, ncol=2)
for (i in 1:M) {
  y <- rnorm(n, 5)
  se_z <- sqrt(var(y)/n) * qnorm(0.975)
  mat[i,] <- mean(y) + se_z * c(-1, 1)
}

mean(mat[,1] < 5 & mat[,2] > 5)

# Confidence interval for a proportion

M <- 10^5; n <- 50; mat <- matrix(NA, nrow=M, ncol=2)
for (i in 1:M) {
  y <- rbinom(n, size=1, prob=0.25)
  p.hat <- mean(y)
  se_z <- sqrt(p.hat * (1-p.hat) / n)
  se_qz <- se_z * qnorm(0.975)
  mat[i,] <- mean(y) + se_qz * c(-1, 1)
}

mean(mat[,1] < 0.25 & mat[,2] > 0.25)

# Computing the p-value for a sample

set.seed(13); n <- 10; y_obs <- rnorm(n)
z_obs <- mean(y_obs) * sqrt(n)
print(z_obs)

M <- 10^5; z_sim <- numeric(M)
for(i in 1:M) {
  y <- rnorm(n)
  z_sim[i] <- mean(y) * sqrt(n)
}
c(mean(z_sim >= z_obs), 1 - pnorm(z_obs))

# Power of two alternative tests

mu <- seq(0, 2, l = 1000); n <- 10; n1 <- 5
plot(mu, 1 - pnorm(1.645 - sqrt(n) * mu), type = "l",
     ylab="Power", xlab = expression(mu))
lines(mu, 1 - pnorm(1.645 - sqrt(n1) * mu), col = 2)
abline(h = 0.05, lty = 2); points(0, 0.05, pch = 16)
^