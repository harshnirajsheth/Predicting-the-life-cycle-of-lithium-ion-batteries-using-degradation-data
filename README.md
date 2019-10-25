# Predicting-the-life-cycle-of-lithium-ion-batteries-using-degradation-data

This repository includes the research work I have been doing with Dr. Rong Pan for Arizona State University. This project is funded by Master's Opportunity for Research in Engineering (MORE).

The first challenge that was faced was cleaning the raw data; the data conntained missing values, there were errors in data collection, removing irrelevant data etc.
The link to the raw batchwise datasets are:
Batch 1: https://data.matr.io/1/projects/5c48dd2bc625d700019f3204/batches/5c86c0b5fa2ede00015ddf67
Batch 2: https://data.matr.io/1/projects/5c48dd2bc625d700019f3204/batches/5c86bf14fa2ede00015ddd83
Batch 3: https://data.matr.io/1/projects/5c48dd2bc625d700019f3204/batches/5c86bd64fa2ede00015ddbb3

After cleaning the data, discharge curves were developed with each of their parametric equations. These parametric equations were used to develop new features for the creating a machine learning model to predict the life cycle of the lithium-ion cells. Initially a ordinary least sqaure regression model was used to predict the life cycle and later it was compared to a quantile regression model.
