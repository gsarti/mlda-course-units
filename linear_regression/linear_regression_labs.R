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
