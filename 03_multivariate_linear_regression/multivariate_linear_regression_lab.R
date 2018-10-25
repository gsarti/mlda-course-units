library(dplyr)
library(PerformanceAnalytics)
library(car)

###########################
##### DATA IMPORT AND CLEAN
###########################

# Visualize dataset content
automobili %>% str()
View(automobili)

# Correcting column type
automobili$emissioniCO2 <- as.double(automobili$emissioniCO2)


# Creating a new column by merging
?paste
row.names(automobili) <- paste(automobili$marca, automobili$modello, automobili$allestimento, sep=" ")

# We select only the three columns on which we perform regression
auto <- automobili %>%  select(accel, potenzacv, massa)
#or
#auto <- subset(automobili, select=c("accel", "potenzacv", "massa"))

# If we want to save the new dataset
#write.table(auto, file="data/auto2.csv", sep=",")


###########################
##### DATA EXPLORATION ####
###########################

d <- auto
pairs(d)

# Plots correlation between variables
chart.Correlation(d)

plot(accel ~ potenzacv, data=d)

# See the car types for some points
identify(d$potenzacv, d$accel, row.names(d))

# Fit a simple linear regression of accel and power
fit0 <- lm(accel ~ potenzacv, data = d)
abline(fit0)

# Visualize the results of regression
summary(fit0)
par(mfrow = c(2, 3), pty = "s")
plot(fit0,1:6)

#Try to make the relationship between accel and potenzacv linear
par(mfrow = c(2, 2), pty = "s")
plot(accel ~ I(log(potenzacv)), data=d)
plot(accel ~ I(sqrt(potenzacv)), data=d)
plot(accel ~ I(1/potenzacv), data=d)
plot(accel ~ I(1/sqrt(potenzacv)), data=d)

fitrecsqrt <- lm(accel ~ I(1/sqrt(potenzacv)), data = d)

# Visualize the new fit
par(mfrow = c(1, 1), pty = "s")
plot(accel ~ I(1/sqrt(potenzacv)), data=d)
abline(fitrecsqrt)
plot(fitrecsqrt)

# Get information about the fit
sfit <- summary(fitrecsqrt)
sfit
sfit$sigma #The estimate of parameter sigma
sfit$r.squared

# Build and plot the confidence interval along the regressor range
new_data <- data.frame(potenzacv = seq(min(d$potenzacv), max(d$potenzacv), length=200))
A <- predict(fitrecsqrt, newdata = new_data, interval = "confidence")
B <- predict(fitrecsqrt, newdata = new_data, interval = "prediction")

?matplot
#TODO: Find missing argument
matplot(new_data, B[, -1], type="l", lty=2, col="blue")
matplot(new_data, A, type="l", lty=3, col="red", add=T)
#TODO: find arguments
#points(,)
#curve(predict(, ), add=T)



#####################################
##### Multivariable Linear Regression
#####################################

fit0 <- lm(accel ~ potenzacv + massa, data=d)
summary(fit0)
par(mfrow = c(3, 2), pty = "s")
plot(fit0, 1:6)

fit1 <- lm(accel ~ I(1/sqrt(potenzacv)) + massa, data=d)
summary(fit1)
plot(fit1, 1:6)

# Is the second model a true improvement with respect
# to the first one? The P value is very small, so the 
# increase in complexity was worth.

anova(fitrecsqrt, fit1)

par(mfrow = c(1, 2), pty = "s")

fitYV = lm(accel ~ massa, data = d)
fitXV = lm(I(1/sqrt(potenzacv)) ~ massa, data = d)

plot(resid(fitYV) ~ resid(fitXV))
abline(h = 0, lty = 2)
abline(v = 0, lty = 2)
abline(lm(resid(fitYV) ~ resid(fitXV)))
summary(lm(resid(fitYV) ~ resid(fitXV)))


fitYX = lm(accel ~ I(1/sqrt(potenzacv)), data = d)
fitVX = lm(massa ~ I(1/sqrt(potenzacv)), data = d)

plot(resid(fitYX) ~ resid(fitVX))
abline(h = 0, lty = 2)
abline(v = 0, lty = 2)
abline(lm(resid(fitYX) ~ resid(fitVX)))
summary(lm(resid(fitYX) ~ resid(fitVX)))



###################################################
##### Polynomial models for nonlinear relationships
###################################################

fitpolin2 <- lm(accel ~ potenzacv + I(potenzacv^2), data = d)
summary(fitpolin2)
par(mfrow = c(3, 2), pty = "s")
plot(fitpolin2,1:6)
plot(fitted(fitpolin2), d$accel)
abline(0, 1)

