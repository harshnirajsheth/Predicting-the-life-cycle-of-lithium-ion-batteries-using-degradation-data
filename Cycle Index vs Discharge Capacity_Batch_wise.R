data1 <- read.csv(file.choose())
data2 <- read.csv(file.choose())
data3 <- read.csv(file.choose())


ggplot(data1, aes(x=Cycle_Index, y=Discharge_Capacity, group=Name, colour=Name,size = I(1))) +
  geom_point()+
  ggtitle('Batch 1') + 
  xlab('Cycle Index') +
  ylab('Discharge Capacity')

ggplot(data2, aes(x=Cycle_Index, y=Discharge_Capacity, group=Name, colour=Name,size = I(1))) +
  geom_point()+
  ggtitle('Batch 2') + 
  xlab('Cycle Index') +
  ylab('Discharge Capacity')

ggplot(data3, aes(x=Cycle_Index, y=Discharge_Capacity, group=Name, colour=Name,size = I(1))) +
  geom_point()+
  ggtitle('Batch 3') + 
  xlab('Cycle Index') +
  ylab('Discharge Capacity')
