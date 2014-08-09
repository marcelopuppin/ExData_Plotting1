#setwd("C:/Projects/R Exploratory Data/ExData_Plotting1")

read_dataset <- function(dataset_path) {
  dataset <- read.table(dataset_path, header=TRUE, sep=";", dec=".")
  dataset
}

create_tidy_data <- function(dataset) {
  only_1st_2nd_feb_2007 <- dataset$Date %in% c("1/2/2007","2/2/2007")
  is_question_mark <- dataset$Global_active_power == "?" 
  tidy_data <- dataset[(only_1st_2nd_feb_2007 & !is_question_mark),]
  tidy_data
}
