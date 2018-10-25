library("UsingR"); data(galton)
par(mfrow=c(1,2), pty="s", pch=20)
hist(galton$child, breaks = 100, main="")
hist(galton$parent, breaks = 100, main="")

library(ggplot2); library(reshape2)
long <- melt(galton) #converts object to dataframe
head(long)
g <- ggplot(long, aes(x=value, fill=variable))
g1 <- g + geom_histogram(colour="black", binwidth=1)
g2 <- g1 + facet_grid(.~variable)
g1;g2

par(mfrow=c(1,1), pty="s", pch=20)
plot(galton$parent, galton$child, pch=20)
ggplot(galton, aes(x = parent, y = child)) + geom_point()

fit <- lm(child ~ parent, data = galton)
predicted_df <- data.frame(child_pred=predict(fit, galton), parent = galton$parent)

# Bubble chart with frequences
ggplot(galton, aes(x = parent, y = child)) + 
  geom_count() +
  geom_line(color='red', data=predicted_df, aes(x = child_pred, y = parent))

y <- galton$child
x <- galton$parent
beta1 <- cor(y,x) * sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)
rbind(c(beta0, beta1), coef(lm(y ~ x)))
cor(y,x)
