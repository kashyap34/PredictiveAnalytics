data <- read.csv(trainingDataPath, header=TRUE, sep=",");
model <- lm(cases ~ year, data);
