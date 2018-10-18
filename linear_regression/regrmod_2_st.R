# Multivariable Regression ex 1

library(datasets)
library(stats)
library(graphics)

# Swiss data (from datasets package)

# Load data and read some information about it


# Explore the dataset by a proper visualization tool
# to investigate any relationship between fertility and the other variables.
# Extra: separate the points by Catholic </> 50%.

pairs(swiss)
pairs(swiss, etc.)


# Estimate the linear model "all" in which Fertility
# is the variable dependent on all the others. 

all <- lm(etc.)

# Look at the summary of the linear model all.
  

# What is the interpretation of the coefficient estimates?
# Explain for each independent variable



# Now generate the summary of another linear model 
# in which Fertility depends only on agriculture.



# Do you see an interesting point when you compare the ast model to the all model?



# Let's consider the relationship between some of the factors. 
# How would you expect Education level and performance on an Examination to be related?
# Check your intuition by computing the correlation between 
# Examination and Education.


# Now find the correlation between Agriculture and Education.


# The negative correlation between Agriculture and Education might be
# affecting Agriculture's influence on Fertility. 

