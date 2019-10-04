Temp <- read.csv(file.choose())
DC <- read.csv(file.choose())

total <- merge(Temp,DC,by="Cycle_Index")

write.csv(total, file = "biplot3.csv")
