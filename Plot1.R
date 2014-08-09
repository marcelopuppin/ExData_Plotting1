#setwd("C:/Projects/R Exploratory Data/ExData_Plotting1")

construct_plot <- function(dataset_path = "../household_power_consumption.txt",
                           png_path = "Plot1.png") {
  
  dataset <- read_dataset(dataset_path)
  tidydata <- create_tidy_data(dataset)
  create_plot_png(tidydata, png_path) 
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

create_plot_png <- function(tidy_data, path) {
  png(filename=path, width=480, height=480)
  
  hist(as.numeric(as.character(tidy_data$Global_active_power)), 
       col="red",
       main="Global Active Power", 
       xlab="Global Active Power (kilowatts)")
  
  dev.off()
}
  
