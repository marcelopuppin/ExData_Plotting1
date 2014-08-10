# Data.R contains functions to read the dataset and create a tidy data 
# to be used when constructing the plot. 
source("Data.R")

construct_plot <- function(dataset_path = "household_power_consumption.txt",
                           png_path = "Plot2.png") {
  
  dataset <- read_dataset(dataset_path)
  tidydata <- create_tidy_data(dataset)
  
  png(filename=png_path, width=480, height=480)
  create_global_active_power_by_dates_plot(tidydata)
  dev.off()
}

create_global_active_power_by_dates_plot <- function(tidy_data) {
  plot(as.numeric(as.character(tidy_data$Global_active_power)), 
       type="l",
       xlab="", xaxt="n",
       ylab="Global Active Power (kilowatts)")  
  
  count_dates <- length(tidy_data$Date)
  axis(1, at=c(0,count_dates/2,count_dates), c("Thu", "Fri", "Sat"))
}
