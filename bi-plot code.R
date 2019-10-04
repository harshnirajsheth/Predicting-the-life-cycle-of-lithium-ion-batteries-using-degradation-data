# import .csv file
data <- read.csv(file.choose())

# using packages
library(dplyr)
library(ggplot2)

# group by Cycle Index and chosing maximum and mean of discharge capacity and temperature respectively
DC <- data %>% group_by(Cycle_Index) %>% summarise(Discharge_Capacity = max(Discharge_Capacity))
T <- data %>% group_by(Cycle_Index) %>% summarise(Temperature = mean(Temperature))

# merging DC and T dataframes
merged <- merge(T,DC,by="Cycle_Index")

# remove the first and last rows of the merged dataframe
merged <- merged[-nrow(merged),]
merged <- merged[-1, ]

# plotting the bi-plot
par(mar=c(5,5,5,5) + 0.4)

## Plot first set of data and draw its axis
plot(merged$Cycle_Index, merged$Discharge_Capacity, axes=FALSE, xlab="", ylab="", 
     type="l",col="black", main="3.6C-80per_3.6C_CH2")
axis(2, ylim=c(0,2),col="black",las=1)  ## las=1 makes horizontal labels
mtext("Discharge Capacity",side=2,line=2.5)
box()

## Allow a second plot on the same graph
par(new=TRUE)

## Plot the second plot and put axis scale on right
plot(merged$Cycle_Index, merged$Temperature, pch=15,  xlab="", ylab="",  
     axes=FALSE, type="l", col="red")

## a little farther out (line=4) to make room for labels
mtext("Temperature",side=4,col="red",line=4) 
axis(4, ylim=c(25,40), col="red",col.axis="red",las=1)

## Draw the Cycle Index axis
axis(1, xlim=c(0,2000),col="black",las=1)
mtext("Cycle Index",side=1,col="black",line=2.5)  

