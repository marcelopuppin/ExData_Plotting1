# Data.R contains functions to read the dataset and create a tidy data 
# to be used when constructing the plot. 
source("Data.R")

construct_plot <- function(dataset_path = "household_power_consumption.txt",
                           png_path = "Plot3.png") {
  
  dataset <- read_dataset(dataset_path)
  tidydata <- create_tidy_data(dataset)
  
  png(filename=png_path, width=480, height=480)
  create_energy_sub_metering_by_dates_plot(tidydata) 
  dev.off()
}

create_energy_sub_metering_by_dates_plot <- function(tidy_data) {
  max_metering_1 <- max(as.numeric(as.character(tidy_data$Sub_metering_1)))
  max_metering_2 <- max(as.numeric(as.character(tidy_data$Sub_metering_2)))
  max_metering_3 <- max(as.numeric(as.character(tidy_data$Sub_metering_3)))
  max_metering <- max(c(max_metering_1,max_metering_2,max_metering_3))
  
  plot(as.numeric(as.character(tidy_data$Sub_metering_1)), 
       type="l", xlab="", ylab="", xaxt="n", yaxt="n", ylim=range(c(0,max_metering)))
  
  par(new=T)
  
  plot(as.numeric(as.character(tidy_data$Sub_metering_2)), 
       type="l", col="red", xlab="", ylab="", xaxt="n", yaxt="n", ylim=range(c(0,max_metering))) 
  
  par(new=T)
  
  plot(as.numeric(as.character(tidy_data$Sub_metering_3)), 
       type="l", col="blue", xlab="", ylab="Energy sub metering", xaxt="n", ylim=range(c(0,max_metering))) 
  
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch=c("_","_","_"), col=c("black","red","blue"))
  
  count_dates <- length(tidy_data$Date)
  axis(1, at=c(0,count_dates/2,count_dates), c("Thu", "Fri", "Sat"))  
}
