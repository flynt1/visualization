# get the data
d <- rd("Employee")


# make sure default style is active
style()


# --------------------
# different histograms
# --------------------

# histogram with all defaults
Histogram(Salary)
# short form
#hs(Salary)

# output saved for later analysis into object h
h <- hs(Salary)
# view full text output
h
# view just the outlier analysis
h$out_outliers
# list the names of all the components
names(h)

# histogram with no borders for the bars
Histogram(Salary, color="off")

# save the histogram to a pdf file
#Histogram(Salary, pdf=TRUE)

# just males employed more than 5 years
Histogram(Salary, rows=(Gender=="M" & Years > 5))

# histogram with red bars, black background, and black border
style(panel_fill="black", fill="red", panel_color="black")
Histogram(Salary)
# or use a lessR pre-defined sequential color palette
#   with some transparency
Histogram(Salary, fill="rusts", color="brown", transparency=.1)

# histogram with purple color theme, translucent gold bars
style("purple", sub_theme="black")
Histogram(Salary)
# back to default color theme
style()

# histogram with specified bin width
# can also use bin_start
Histogram(Salary, bin_width=12000)

# histogram with rotated axis values, offset more from axis
# suppress text output
style(rotate_x=45, offset=1)
Histogram(Salary, quiet=TRUE)
style()

# histogram with specified bins and grid lines displayed over the histogram
Histogram(Salary, breaks=seq(0,150000,20000), xlab="My Variable")

# histogram with bins calculated with the Scott method and values displayed
Histogram(Salary, breaks="Scott", values=TRUE, quiet=TRUE)

# histogram with the number of suggested bins, with proportions
Histogram(Salary, breaks=15, stat_x="proportion")

# histogram with non-default values for x- and y-axes
d[2,4] <- 45000
Histogram(Salary, scale_x=c(30000,130000,5), scale_y=c(0,9.5,5))

# ----------------
# Trellis graphics
# ----------------
Histogram(Salary, by1=Dept)


# ---------------------
# cumulative histograms
# ---------------------

# cumulative histogram with superimposed regular histogram, all defaults
Histogram(Salary, cumulate="both")

# cumulative histogram plus regular histogram
Histogram(Salary, cumulate="both", reg="mistyrose")

# -------------
# density plots
# -------------

# default density plot
Histogram(Salary, density=TRUE)

# normal curve and general density curves superimposed over histogram
# all defaults
Histogram(Salary, density=TRUE, type="both")

# display only the general estimated density
#  so do not display the estimated normal curve
# specify the bandwidth for the general density curve,
#  use the standard bandwidth option for the density function
Histogram(Salary, density=TRUE, bandwidth=8000)

# display only the general estimated density and a corresponding
#  interval of unit width around x.pt
Histogram(Salary, density=TRUE, x.pt=40000)

# densities for all specified numeric variables in a list of variables
# e.g., use the combine or c function to specify a list of variables
Histogram(c(Years,Salary), density=TRUE)


# -------------------------------------------------
# histograms for data frames and multiple variables
# -------------------------------------------------

# create data frame, d, to mimic reading data with Read function
# d contains both numeric and non-numeric data
d <- data.frame(rnorm(50), rnorm(50), rnorm(50), rep(c("A","B"),25))
names(d) <- c("X","Y","Z","C")

# although data not attached, access the variable directly by its name
Histogram(X)

# histograms for all numeric variables in data frame called d
#  except for numeric variables with unique values < n_cat
# d is the default name, so does not need to be specified with data
Histogram()

# histogram with specified options, including red axis labels
style(fill="palegreen1", panel_fill="ivory", axis_color="red") 
Histogram(values=TRUE)
style()  # reset

# histograms for all specified numeric variables
# use the combine or c function to specify a list of variables
Histogram(c(X,Y))


# -----------
# annotations
# -----------

d <- rd("Employee")

# Place a message in the top-right of the graph
# Use \n to indicate a new line
hs(Salary, add="Salaries\nin our Company", x1=100000, y1=7)

# Use style to change some parameter values
style(add_trans=.8, add_fill="gold", add_color="gold4",
      add_lwd=0.5, add_cex=1.1)
# Add a rectangle around the message centered at <100000,7>
hs(Salary, add=c("rect", "Salaries\nin our Company"),
   x1=c(82000, 100000), y1=c(7.7, 7), x2=118000, y2=6.2)