# Data.R contains functions to read the dataset and create a tidy data 
# to be used when constructing the plot. 
source("Data.R")

construct_plot <- function(dataset_path = "household_power_consumption.txt",
                           png_path = "Plot3.png") {
  
  dataset <- read_dataset(dataset_path)
  tidydata <- create_tidy_data(dataset)
  create_plot_png(tidydata, png_path) 
}

create_plot_png <- function(tidy_data, path) {
  png(filename=path, width=480, height=480)
  
  plot(as.numeric(as.character(tidy_data$Sub_metering_1)), 
       type="l", xlab="", ylab="", xaxt="n", yaxt="n", ylim=range(c(0,40)))
  
  par(new=T)
  
  plot(as.numeric(as.character(tidy_data$Sub_metering_2)), 
       type="l", col="red", xlab="", ylab="", xaxt="n", yaxt="n", ylim=range(c(0,40))) 
  
  par(new=T)
  
  plot(as.numeric(as.character(tidy_data$Sub_metering_3)), 
       type="l", col="blue", xlab="", ylab="Energy sub metering", xaxt="n", ylim=range(c(0,40))) 
  
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch=c("_","_","_"), col=c("black","red","blue"))
  
  axis(1, at=c(0,1450,2900), c("Thu", "Fri", "Sat"))
  
  dev.off()
}
  
