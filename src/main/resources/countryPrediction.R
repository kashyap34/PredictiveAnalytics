#data <- read.csv(trainingDataPath, header=TRUE, sep=",");
#model <- lm(cases ~ year, data);

caseSeries <- ts(case, start=c(2006));
# Use HoltWinters for forecasting
#caseSeriesForecast <- HoltWinters(caseSeries, beta=FALSE, gamma=FALSE, l.start = 1528);
#caseSeriesForecast;
#caseSeriesForecast2 <- forecast.HoltWinters(caseSeriesForecast, h=7);

library("forecast");

# Use Autoregressive Integrated Moving Average (ARIMA) for forecasting
model <- auto.arima(caseSeries);
#caseForecast <- forecast(model, h=7); 
