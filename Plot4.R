setwd("C:/Projects/R Exploratory Data/ExData_Plotting1")

construct_plot <- function(dataset_path = "../household_power_consumption.txt",
                           png_path = "Plot4.png") {
  
  dataset <- read_dataset(dataset_path)
  tidydata <- create_tidy_data(dataset)
  
  png(filename=png_path, width=480, height=480)
  
  par(mfrow=c(2,2))
  
  create_plot_top_left(tidydata) 
  create_plot_top_right(tidydata) 
  create_plot_bottom_left(tidydata) 
  create_plot_bottom_right(tidydata) 
  
  dev.off()
}

read_dataset <- function(dataset_path) {
  dataset <- read.table(dataset_path, header=TRUE, sep=";", dec=".")
  dataset
}

create_tidy_data <- function(dataset) {
  only_feb_2007 <- dataset$Date %in% c("1/2/2007","2/2/2007")
  is_question_mark <- dataset$Global_active_power == "?" 
  tidy_data <- dataset[(only_feb_2007 & !is_question_mark),]
  tidy_data
}

create_plot_top_left <- function(tidy_data) {
  plot(as.numeric(as.character(tidy_data$Global_active_power)), 
       type="l", 
       xlab="", xaxt="n",
       ylab="Global Active Power (kilowatts)")  
  
  days <- c("Thu", "Fri", "Sat")
  axis(1, at=1:3, lab=days)
}

create_plot_top_right <- function(tidy_data) {
  plot(as.numeric(as.character(tidy_data$Voltage)), 
       type="l", 
       xlab="datetime", xaxt="n",
       ylab="Voltage")  
  
  days <- c("Thu", "Fri", "Sat")
  axis(1, at=1:3, lab=days)
}

create_plot_bottom_left <- function(tidy_data) {
  plot(as.numeric(as.character(tidy_data$Sub_metering_1)), 
       type="l", xlab="", ylab="", xaxt="n", yaxt="n", ylim=range(c(0,40)))
  
  par(new=T)
  
  plot(as.numeric(as.character(tidy_data$Sub_metering_2)), 
       type="l", col="red", xlab="", ylab="", xaxt="n", yaxt="n", ylim=range(c(0,40))) 
  
  par(new=T)
  
  plot(as.numeric(as.character(tidy_data$Sub_metering_3)), 
       type="l", col="blue", xlab="", ylab="Energy sub metering", xaxt="n", ylim=range(c(0,40))) 
  
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch=c("_","_","_"), col=c("black","red","blue"))
  
  days <- c("Thu", "Fri", "Sat")
  axis(1, at=1:3, lab=days)
}
  
create_plot_bottom_right <- function(tidy_data) {
  plot(as.numeric(as.character(tidy_data$Global_reactive_power)), 
       type="l", 
       xlab="datetime", xaxt="n",
       ylab="Global Reactive Power")  
  
  days <- c("Thu", "Fri", "Sat")
  axis(1, at=1:3, lab=days)
}