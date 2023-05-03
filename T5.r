
# Load the dataset
data <-read.csv("day.csv")



# Preprocessing...

columns = c("cnt")
bikes = data.frame(matrix(nrow=731, ncol=length(columns)))
colnames(bikes) = columns

bikes$cnt = data$cnt # Variable to predict

# Predictors...

bikes$workingday <- data$workingday
bikes$holiday <- data$holiday

# One-hot encoding for season
bikes$season_1 <- ifelse(data$season == 1, 1, 0)
bikes$season_2 <- ifelse(data$season == 2, 1, 0)
bikes$season_3 <- ifelse(data$season == 3, 1, 0)

# Create MISTY and RAIN features
bikes$MISTY <- ifelse(data$weathersit == 2, 1, 0)
bikes$RAIN <- ifelse(data$weathersit == 3 | data$weathersit == 4, 1, 0)

# Denormalize temp, hum, and windspeed
bikes$temp <- data$temp * 47 + -8
bikes$hum <- data$hum * 100
bikes$windspeed <- data$windspeed * 67

# Create days_since_2011 feature
bikes$days_since_2011 <- as.numeric(difftime(as.Date(data$dteday), as.Date("2011-01-01"), units = "days"))




# EXERCISE 1: One Dimensional Partial Dependance Plot ###################################################

library(randomForest)

set.seed(123) # for reproducibility
rf_model <- randomForest(cnt ~ workingday + holiday + season_1 + season_2 + season_3 + MISTY + RAIN + temp + hum + windspeed + days_since_2011, data = bikes)

library(pdp)
library(ggplot2)

# Create the four partial dependence plots with custom axis labels

days_since_2011_pdp <- partial(rf_model, pred.var = "days_since_2011", plot = TRUE, plot.engine = "ggplot2") + 
  ggtitle("Partial dependency plot") + 
  xlab("Days Since 2011") + 
  ylab("Predicted Bike Counts")

temp_pdp <- partial(rf_model, pred.var = "temp", plot = TRUE, plot.engine = "ggplot2") + 
  ggtitle("Partial dependency plot") + 
  xlab("Temperature") + 
  ylab("Predicted Bike Counts")

hum_pdp <- partial(rf_model, pred.var = "hum", plot = TRUE, plot.engine = "ggplot2") + 
  ggtitle("Partial dependency plot") + 
  xlab("Humidity") + 
  ylab("Predicted Bike Counts")

windspeed_pdp <- partial(rf_model, pred.var = "windspeed", plot = TRUE, plot.engine = "ggplot2") + 
  ggtitle("Partial dependency plot") + 
  xlab("Wind Speed") + 
  ylab("Predicted Bike Counts")



library(gridExtra)

# Combine the four plots into a single plot grid
grid.arrange(days_since_2011_pdp, temp_pdp, hum_pdp, windspeed_pdp, nrow = 2, ncol = 2)



# EXERCISE 2: Bidimensional Partial Dependance Plot ###################################################

# Same random seed, also for reproducibility reasons...
set.seed(123)

# Sample 250 rows at random
sample_index <- sample(nrow(bikes), 250, replace = FALSE)
bike_samples <- bikes[sample_index, ]

# Train the random forest model...
rf_model2 <- randomForest(cnt ~ temp + hum, data = bike_samples)

pdp_data = partial(rf_model2, pred.var = c('temp', 'hum'))
summary(pdp_data)
head(pdp_data)

ggplot(pdp_data, aes(x = temp, y=hum, fill = yhat)) +
  geom_tile() +
  ggtitle('Bidimensional partial dependency') +
  scale_fill_gradient (low = 'yellow', high = 'red', name = 'Predicted Bike counts')



