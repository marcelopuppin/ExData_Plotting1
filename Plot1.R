# Data.R contains functions to read the dataset and create a tidy data 
# to be used when constructing the plot. 
source("Data.R")

construct_plot <- function(dataset_path = "household_power_consumption.txt",
                           png_path = "Plot1.png") {
  
  dataset <- read_dataset(dataset_path)
  tidydata <- create_tidy_data(dataset)
  create_plot_png(tidydata, png_path) 
}

create_plot_png <- function(tidy_data, path) {
  png(filename=path, width=480, height=480)
  
  hist(as.numeric(as.character(tidy_data$Global_active_power)), 
       col="red",
       main="Global Active Power", 
       xlab="Global Active Power (kilowatts)")
  
  dev.off()
}
  
