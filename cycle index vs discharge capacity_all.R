#Importing all the csv files

b1_ch1 <- read.csv(file.choose())
b1_ch12 <- read.csv(file.choose())
b1_ch24 <- read.csv(file.choose())
b1_ch36 <- read.csv(file.choose())
b1_ch48 <- read.csv(file.choose())

b2_ch10 <- read.csv(file.choose())
b2_ch20 <- read.csv(file.choose())
b2_ch30 <- read.csv(file.choose())
b2_ch40 <- read.csv(file.choose())

b3_ch5 <- read.csv(file.choose())
b3_ch10 <- read.csv(file.choose())
b3_ch21 <- read.csv(file.choose())
b3_ch27 <- read.csv(file.choose())

#Creating a dataset binding all columns from the imported .csv files
data <- rbind(b1_ch1, b1_ch12,b1_ch24, b1_ch36,b1_ch48,b2_ch10,b2_ch20, b2_ch30,b2_ch40,b3_ch10,b3_ch21,b3_ch27,b3_ch5)

#Saving the dataset
write.csv(data, file = "Cycle Index vs Discharge Capacity_all batches.csv")

#Removing the extra column from datasets of batch 3
b3_ch10 <- b3_ch10[,-c(17)]

#Plotting the charts using data file
b3_ch5['Name']<-'b3_ch5'
ggplot(data, aes(x=Cycle_Index, y=Discharge_Capacity, group=Name, colour=Name,size = I(1))) + geom_point()
