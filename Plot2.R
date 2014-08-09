#setwd("C:/Projects/R Exploratory Data/ExData_Plotting1")

construct_plot <- function(dataset_path = "household_power_consumption.txt",
                           png_path = "Plot2.png") {
  
  dataset <- read_dataset(dataset_path)
  tidydata <- create_tidy_data(dataset)
  tidydata <- add_day_of_week_to_tidy_data(tidydata)
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

convert_date_str_to_day_of_week <- function(date_str, format_str="%d/%m/%Y") {
  date <- as.Date(date_str, format=format_str)  
  day_of_week_number <- format(date, format="%u")
  day_of_week_abbreviation <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
  day_of_week_abbreviation[as.numeric(day_of_week_number)]
}

add_day_of_week_to_tidy_data <- function(tidy_data) {
   days_of_week <- sapply(tidy_data$Date, convert_date_str_to_day_of_week)
   tidy_data <- cbind(days_of_week, tidy_data)
   colnames(tidy_data)[1] <- c("DayOfWeek") 
   tidy_data
}

create_plot_png <- function(tidy_data, path) {
  png(filename=path, width=480, height=480)
  
  plot(as.numeric(as.character(tidy_data$Global_active_power)), 
       type="l",
       xlab="", xaxt="n",
       ylab="Global Active Power (kilowatts)")  
  
  axis(1, at=c(0,1450,2900), c("Thu", "Fri", "Sat"))
  
  dev.off()
}
  
