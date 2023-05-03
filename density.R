
# make sure default style is active
style()

# create data frame, d, to mimic reading data with Read function
# d contains both numeric and non-numeric data
d <- data.frame(rnorm(50), rnorm(50), rnorm(50), rep(c("A","B"),25))
names(d) <- c("X","Y","Z","C")

#  general density curves superimposed over histogram, all defaults
Histogram(Y, density=TRUE)

# see Histogram for more examples, also the corresponding vignette