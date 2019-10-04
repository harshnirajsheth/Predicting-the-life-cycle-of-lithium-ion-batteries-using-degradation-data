# importing dataset
data1 = read.csv(file.choose())
summary(data1)

install.packages('tidyverse')
installed.packages('gapminder')

# plotting a boxplot
library(tidyverse)
library(gapminder)

data1 %>% 
  ggplot(aes(x=C1,y=Cycle.life, group=C1, color = Batch.date)) +
  geom_boxplot() + geom_point(alpha = 0.8, size = I(2)) +
  ggtitle('One Stage Charging Boxplot') +
  xlab('C1') +
  ylab('Cycle Life')

summary(data1)
