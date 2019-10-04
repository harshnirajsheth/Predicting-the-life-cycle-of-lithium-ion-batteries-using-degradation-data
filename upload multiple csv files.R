install.packages('plyr')
install.packages('readr')
install.packages('ldply')

mydir = "New"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles

dat_csv = ldply(myfiles, read_csv)
dat_csv

summary(myfiles)

b_2 <- read.csv(file.choose())
ggplot(dat_csv, aes(x=Cycle_Index, y=Discharge_Capacity, group=Name, colour=Name,size = I(1))) + geom_point()+ggtitle('Discharge Capacity vs Cycle Index - Batch 2017-05-12')+ xlab('Cycle Index') + ylab('Discharge Capacity')
