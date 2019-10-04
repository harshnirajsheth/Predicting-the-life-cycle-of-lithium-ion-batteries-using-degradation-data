#Importing the dataset
a = read.csv(file.choose())

#Filtering the data keeping the rows of distinct cycle index with the maximum discharge capacity
b <- a %>% group_by(Cycle_Index) %>% summarise(Discharge_Capacity = max(Discharge_Capacity))

#Removing first and last rows
b <- b[-nrow(b),]
b <- b[-1, ]

#Adding a name column to the dataframe
b['Name']<-'3.6C-80%-3.6C_CH3'

#Saving the dataset
write.csv(b, file = "2_3.csv")
