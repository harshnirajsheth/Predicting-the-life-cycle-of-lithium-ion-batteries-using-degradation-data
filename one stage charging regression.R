# Simple Linear Regression

# Importing the dataset
dataset = read.csv(file.choose())
testset = read.csv(file.choose())

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Cycle.life ~ C1,
               data = dataset)

# Predicting the Test set results
y_pred = predict(regressor, newdata = dataset)

# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$C1, y = dataset$average.life.cycle),
             colour = 'red') +
  geom_line(aes(x = dataset$C1, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('One Stage Charging Cells') +
  xlab('C1') +
  ylab('Cycle Life')

summary(regressor)

# Visualising the Test set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = testset$C1, y = testset$Cycle.life),
             colour = 'red') +
  geom_line(aes(x = dataset$C1, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of experience') +
  ylab('Salary')

summary(regressor)

testset$Cycle.life - predict(regressor, newdata = dataset)
help(resid)
 summary(residuals(regressor))                                    
 