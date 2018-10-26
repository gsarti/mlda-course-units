library(dplyr)
library(PerformanceAnalytics)
library(ggplot2)
library(leaps)

usc %>% head()

usc %>% summary

#Just the sud variable is a categorical factor

ggplot(usc, aes()) + geom_jitter()
??melt

# Remove expp0 and expp1 from the dataset since they are 
# CONSEQUENCES, not causes of the high criminality!
# Moreover, they may create false relations since they are strongly related with criminality

cor(usc)

chart.Correlation(usc)

#plotcorr(cor(usc)) with library(ellipse)

lm(y ~ expp0, data=usc) %>% summary
lm(y ~ expp1, data=usc) %>% summary
lm(formula = y ~ expp0 + expp1, data = USC) %>% summary

lm(y ~ assets, data=usc) %>% summary
lm(y ~ poverty, data=usc) %>% summary
lm(formula = y ~ poverty + assets, data = USC) %>% summary

#remove collinear variables
usc <- usc %>% select(-c("expp0", "expp1"))

fit <- lm(y ~ ., data = usc)
summary.lm(fit)
plot(fit)

# 11 regressors, 2^11 = 2048 possible models

x <- usc[,-1]
y <- usc$y

# Automatically determine the best subset for linear regression model
leap <- leaps(x = x, 
              y = y, 
              method = c("r2"),
              nbest = 1,
              names = names(x))
names(leap)
leap$which
leap$label
leap$size
leap$r2

# p is the number of predictors
regsub <- regsubsets(x = x, y = y, nbest = 1, nvmax = p)
names(regsub)
regsub %>% summary
regsub_s <- summary(regsub)
names(regsub_s)

# The R² graph isn't enough to decide the best model
# R² grows even when non-relevant variables are added.

# Compute AIC, BIC for model selection
#AIC should be minimized
m <- list()
aic_v <- bic_v <- c()
for (i in 1:nrow(leap$which)) {
  m[[i]] <- lm(y ~ ., data = cbind(y, x[leap$which[i, ]]))
  aic_v[i] <- AIC(m[[i]])
  bic_v[i] <- BIC(m[[i]])
}
m[[which.min(aic_v)]]
lm(formula = y ~ ., data = cbind(y, x[leap$which[i, ]]))

m[[which.min(bic_v)]]
lm(formula = y ~ ., data = cbind(y, x[leap$which[i, ]]))

vif(m[[which.min(aic_v)]])
vif(m[[which.min(bic_v)]])
cor(y, x["unempl1"])
cor(y, x["unempl2"])
cor(y, x["assets"])
cor(y, x["poverty"])

#We should think about eliminating correlated values such as
#unempl1 and unempl2, assets and poverty

# Stepwise selection