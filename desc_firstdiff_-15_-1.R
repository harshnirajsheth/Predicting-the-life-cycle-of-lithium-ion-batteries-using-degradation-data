data = read.csv(file.choose())

install.packages('dplyr')

# arranging the rows according to the descending order of cycle index
arrange(data, desc(Cycle_Index))

# finding the first difference of the Discharge Capacities
data <- within(data, difference <- c(NA,diff(Discharge_Capacity)))

# removing last 15 rows
data <- data[-seq(nrow(data),nrow(data)-15),]

# removing the first row 
data <- data[-c(1),]

#Saving the dataset
write.csv(data, file = "!1_48.csv")
