# Data.R contains functions to read the dataset and create a tidy data 
# to be used when constructing the plot. 
source("Data.R")
source("Plot2.R")
source("Plot3.R")

construct_plot <- function(dataset_path = "household_power_consumption.txt",
                           png_path = "Plot4.png") {
  
  dataset <- read_dataset(dataset_path)
  tidydata <- create_tidy_data(dataset)
  
  png(filename=png_path, width=480, height=480)
  
  par(mfrow=c(2,2))
  
  create_global_active_power_by_dates_plot(tidydata) 
  create_voltage_by_dates_plot(tidydata)
  create_energy_sub_metering_by_dates_plot(tidydata) 
  create_global_reactive_power_by_dates_plot(tidydata) 
  
  dev.off()
}

create_voltage_by_dates_plot <- function(tidy_data) {
  plot(as.numeric(as.character(tidy_data$Voltage)), 
       type="l", 
       xlab="datetime", xaxt="n",
       ylab="Voltage")  
  
  count_dates <- length(tidy_data$Date)
  axis(1, at=c(0,count_dates/2,count_dates), c("Thu", "Fri", "Sat"))
}

create_global_reactive_power_by_dates_plot <- function(tidy_data) {
  plot(as.numeric(as.character(tidy_data$Global_reactive_power)), 
       type="l", 
       xlab="datetime", xaxt="n",
       ylab="Global Reactive Power")  
  
  count_dates <- length(tidy_data$Date)
  axis(1, at=c(0,count_dates/2,count_dates), c("Thu", "Fri", "Sat"))
}
