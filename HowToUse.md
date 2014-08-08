Exploratory Data Analysis
=========================

Project 1 - How to use:

Download the dataset "Electric power consumption [20Mb]" and copy it to your local directory.
https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

Clone this project, open the R Studio, set the working directory and run the following commands in R:
```
sources("Plot<N>.R")
construct_plot()
```
where <N> is the plot number 1, 2, 3 or 4.

Example:
```
sources("Plot1.R")
construct_plot()
```

You can also specify your dataset root directory:
```
sources("Plot2.R")
construct_plot("C:/exploratory-data-analysis/project-1/household_power_consumption.txt")
```

It will create the corresponding png file Plot<N>.png in your working directory.
