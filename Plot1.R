# Data.R contains functions to read the dataset and create a tidy data 
# to be used when constructing the plot. 
source("Data.R")

construct_plot <- function(dataset_path = "household_power_consumption.txt",
                           png_path = "Plot1.png") {
  
  dataset <- read_dataset(dataset_path)
  tidydata <- create_tidy_data(dataset)
  
  png(filename=png_path, width=480, height=480)
  create_frequency_by_global_active_power_plot(tidydata)
  dev.off()
}

create_frequency_by_global_active_power_plot <- function(tidy_data) {
  hist(as.numeric(as.character(tidy_data$Global_active_power)), 
       col="red",
       main="Global Active Power", 
       xlab="Global Active Power (kilowatts)")
}
