# "regression toward the mean" 

# From one generation to the next the heights moved closer to the average or regressed toward the mean.

# From the Galton study on hereditary height
# Sir Francis Galton 's parent/child height data
# from http://wienformulaer.math.csi.cuny.edu/UsingR/

# Load the library (UsingR) and data (galton) needed

install.packages('UsingR', dependencies = TRUE, repos = 'http://cran.rstudio.com')
install.packages('faraway', dependencies = TRUE, repos = 'http://cran.rstudio.com')
data = galton

# Explore graphically the relationship between parent/child heights

plot(galton$parent, galton$child, xlab='child', ylab = 'arent')

# Note that there are more observations for each point.
# Make the graph more informative on this respect (hint: jitter data; point size dependent on numerosity)


# Fit a LS line with "lm"
?formula

regrline <- lm(  ~ , galton)

# add the regression line to the plot with "abline".


# Accuracy of estimation is gauged by theoretical techniques and expressed in terms of "standard error." 
# Look at R summary on estimation.


# From the output of "summary" what is the slope of the regression line?
# What is the standard error of the slope?
# Plot the line that would result if there weren't the "regression to the mean" phenomenon


# Residuals
# Checking the main assumptions on residuals
# A preview of diagnostic plots
# check the mean of residuals


# check the correlation between the residuals and the predictors


# Note: The two properties of the residuals we've emphasized here can be applied to datasets which have multiple predictors. 


# Question
# variance of residuals
# 
# 1: is less than the variance of data
# 2: is greater than the variance of data
# 3: is unknown without actual data


# Residual Variation.
# Residuals are useful for indicating how well data points fit a statistical model.

# What is the standard deviation of the error?


# What is the percent of total variation (of Y) contributed by the residuals?


# Check that the percent of total variation (of Y) explained by the regression  model is the squared correlation of galton's data



