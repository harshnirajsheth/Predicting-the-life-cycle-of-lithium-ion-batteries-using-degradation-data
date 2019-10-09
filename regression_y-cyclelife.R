data = read.csv(file.choose())

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')

#library(caTools)
#set.seed(123)
#split = sample.split(data$Average.Cycle.Life, SplitRatio = .9)
#training_set = subset(data, split == TRUE)
#test_set = subset(data, split == FALSE)

regressor = lm(formula = Cycle.life ~ Elbow_Point + Area + C1 + C2 + X1or2, data = data)
summary(regressor)

y_pred = predict(regressor, newdata = data)

y_pred

 
regressor.res = resid(regressor)
regressor.res
plot(data$Cycle.life, y_pred, ylab="Predicted Cycle Life", xlab="Actual Cycle Life", main="Predicted vs Actual") 

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

library(ggplot2)
ggplot() +
  geom_point(aes(x = data$Cycle.life, y = y_pred),
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
