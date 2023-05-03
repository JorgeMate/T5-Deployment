# T5-Deployment
## Jorge Maté Martínez
Deployment: Model-agnostic methods

### Exercise 1: 1 dimensional dependency plot
Apply PDP to the regression example of predicting bike rentals. Fit a random forest approximation for the prediction of bike rentals (cnt). Use the partial dependence plot to visualize the relationships the model learned. Use the slides shown in class as model.  

### QUESTION:
**Analyse the influence of days since 2011, temperature, humidity and wind speed on the predicted bike counts.**

Days since 2011 shows that the predicted bike rentals have been steadily increasing since 2011, with a few fluctuations. This suggests that there is a positive relationship between days_since_2011 and the predicted bike rentals.

Temperature shows an inverted U-shaped relationship between temp and the predicted bike rentals, with higher rentals at moderate temperatures (around 20-25 degrees Celsius). This suggests that the relationship between temp and the predicted bike rentals is not linear, but rather has a more complex shape.

The Humidity PDP shows a slightly negative relationship between hum and the predicted bike rentals, with lower rentals at higher humidity levels. This suggests that high humidity may be a deterrent for people to rent bikes.

The Win Speed PDP graph shows a roughly linear negative relationship between windspeed and the predicted bike rentals, with lower rentals at higher wind speeds. This suggests that high winds may make it less desirable to rent bikes.

In summary, the PDPs suggest that days_since_2011 has a positive influence on the predicted bike rentals, while temp has a U-shaped influence, hum has a slightly negative influence, and windspeed has a roughly linear negative influence. However, it's important to note that PDPs only show the marginal influence of a single variable on the outcome, while holding all other variables constant at their average values. The true relationships between the variables and bike rentals may be more complex and may involve interactions between variables.



### Exercise 2: 2 dimensional dependency plot
Generate a 2D Partial Dependency Plot with humidity and temperature to predict the number of bikes rented depending on those parameters.

### QUESTION:
**Generate a 2D Partial Dependency Plot with humidity and temperature to predict the number of bikes rented depending on those parameters.**

The generated bidimensional partial dependency graph displays how combined humidity and temperature affect the amount of rented bikes. 

When temperature is between 17 and 22 (aprox.) and humidity is between 45 and 70 (aprox.) the highest results are produced.

Very low temperature and humidity produce te contrary effect: The reduction of the predicted bike counts.

Temperature itself above 12 (aprox) is also an indicator of good rented bikes results, as humidity behaves as better increaser of the bike counts if it has not got extreme values (under 25 or above 85 aprox.)



### Exercise 3: PDP to explain the price of a house
Apply the previous concepts to predict the price of a house from the database kc_house_data.csv. In this case, use again a random forest approximation for the prediction based on the features bedrooms, bathrooms, sqft_living, sqft_lot, floors and yr_built.

### QUESTION:
**Analyse the influence of bedrooms, bathrooms, sqft_living and floors on the predicted price.**

There is a positive relationship between the house bedrooms number and the predicted price, this is very clear for houses up to 3 bedrooms or between 4 and 6. As a curious thing, it looks like between 3 and 4 bedrooms and with more than 6, these extra rooms are not appreciated by the buyer as a fact to pay more money for those houses. 

About the bathrooms number, there is also a logical positive relationship between the number of bathrooms and the predicted price. The house price increases specially for 5 or six bathrooms.

The square feet of the house has also a positive relationship with the house price and increases constantly with it. Above 7000 sqr. feet it is specially noticeable.

The floors number also affect positively to the house price up to 3 floors. It seems that houses with more floors (that should be very uncommon) are not increasing the final sales price.










