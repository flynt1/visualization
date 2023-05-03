# get the data from a file included with lessR
d <- rd("Employee")

# --------------------------------------------------------
# pie (doughnut) chart from the data for a single variable
# --------------------------------------------------------

# basic pie chart, actually a doughnut or ring chart
# with default hcl colors (except for themes "gray" and "white")
PieChart(Dept)
# short name
#pc(Dept)

# standard pie chart with no hole
pc(Dept, hole=0)

# specify a unique slice color for each of the two slices
# turn off borders
PieChart(Gender, fill=c("pink","lightblue"), lty="blank")

# just males with a salary larger than 75000 USD
PieChart(Dept, rows=(Gender=="M" & Salary > 75000))

# use getColors function to create the pie slice colors
# here as a separate function call
# need to set the correct number of colors to span the full range
mycolors <- getColors("aliceblue", end_pal="steelblue", n=5)
PieChart(Dept, fill=mycolors)

# specify the colors from a predefined color palette
# see ?getColors
PieChart(Dept, fill="blues")

# viridis color palette
PieChart(Dept, fill="viridis")

# display the percentage inside each slice of the pie
# provide a unique color for each displayed value
PieChart(Dept, values="%",
         values_color=c("yellow", "pink", "blue", "purple", "brown"))

# display the counts inside each slice of the pie
# reduce size of displayed counts to 0.75
PieChart(Dept, values="input", values_size=0.75,
         values_color=getOption("window_fill"))

# add transparency and custom color for the displayed values
PieChart(Dept, transparency=.6, values="%", values_color=rgb(.3,.3,.3))

# map counts of each level to the fill color of the corresponding slice
PieChart(JobSat, fill=(count))


# ------------------------------
# pie chart directly from counts
# ------------------------------

# from vector
# pie chart of one variable with three levels
# enter counts as a vector with the combine function, c
# must supply the level names and variable name
# use abbreviation pc for PieChart
City <- c(206, 94, 382)
names(City) <- c("LA","Chicago","NY")
pc(City, main="Employees in Each City")

# counts from data frame
x <- c("ACCT", "ADMN", "FINC", "MKTG", "SALE")
y <- c(5, 6, 4, 6, 15)
d <- data.frame(x,y)
names(d) <- c("Dept", "Count")
PieChart(Dept, Count)

# real numbers from data frame 
Dept <- c("ACCT", "ADMN", "FINC", "MKTG", "SALE")
Salary <- c(86208.42, 29808.29, 42305.52, 75855.81, 65175.51)
d <- data.frame(x,y)
pc(Dept, Salary)
rm(Dept)
rm(Salary)

# -----------
# annotations
# -----------

d <- rd("Employee")

# Place a message in the center of the pie
# Use \n to indicate a new line
PieChart(Dept, add="Employees by\nDepartment", x1=0, y1=0)

# Use style to change some parameter values
style(add_trans=.8, add_fill="gold", add_color="gold4", add_lwd=0.5)
# Add a rectangle around the message centered at <0,0>
PieChart(Dept, add=c("rect", "Employees by\nDepartment"),
         x1=c(-.4,0), y1=c(-.2, 0), x2=.4, y2=.2)