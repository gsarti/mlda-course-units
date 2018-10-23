y <- (nhtemp - 32) / 1.8
plot(1912:1971, y, pch = 20, xlab = "Year", ylab = "y")
set.seed(2018); ysim <- rnorm(length(y), m = mean(y), s = sd(y))
points(1912:1971, ysim, col =2, pch = 20)
