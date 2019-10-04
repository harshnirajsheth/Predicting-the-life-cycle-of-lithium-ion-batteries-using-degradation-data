data = read.csv(file.choose())

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(data$Average.Cycle.Life, SplitRatio = .9)
training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)

regressor = lm(formula = Average.Cycle.Life ~ xsum, data = training_set)
summary(regressor)

y_pred = predict(regressor, newdata = training_set)

y_pred

 
regressor.res = resid(regressor)

plot(data$Average.Cycle.Life, regressor.res, ylab="Residuals", xlab="Average Cycle Life", main="Residuals vs Actual") 

help(resid)

data$predicted <- predict(regressor)   # Save the predicted values
data$residuals <- residuals(regressor) # Save the residual values

# Other useful functions
coefficients(regressor) # model coefficients
confint(regressor, level=0.95) # CIs for model parameters
fitted(regressor) # predicted values
residuals(regressor) # residuals
anova(regressor) # anova table
vcov(regressor) # covariance matrix for model parameters
influence(regressor) # regression diagnostics

# diagnostic plots
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page
plot(regressor)

ggplot() +
  geom_point(aes(x = data$Average.Cycle.Life, y = data$predicted),
             colour = 'red')  +
  ggtitle('Predicted vs Actual') +
  xlab('Actual') +
  ylab('Predicted')

ggplot() +
  geom_point(aes(x = data$xsum, y = data$Average.Cycle.Life),
             colour = 'red') +
  geom_line(aes(x = data$xsum, y = data$predicted),
            colour = 'blue') +
  ggtitle('Average Cycle Life vs Xsum') +
  xlab('Xsum') +
  ylab('Average Cycle Life')
