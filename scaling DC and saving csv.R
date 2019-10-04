data = read.csv(file.choose())

data %>% arrange(Discharge_Capacity)

data$DC = data$Discharge_Capacity/head(data$Discharge_Capacity, n=1)

write.csv(data, file = "@3_48.csv")
