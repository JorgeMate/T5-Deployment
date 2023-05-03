# T5-Deployment
## Jorge Maté Martínez
Deployment: Model-agnostic methods

### Exercise 1:
Apply PDP to the regression example of predicting bike rentals. Fit a random forest approximation for the prediction of bike rentals (cnt). Use the partial dependence plot to visualize the relationships the model learned. Use the slides shown in class as model.  

### QUESTION:
Analyse the influence of days since 2011, temperature, humidity and wind speed on the predicted bike counts.

Days since 2011 shows that the predicted bike rentals have been steadily increasing since 2011, with a few fluctuations. This suggests that there is a positive relationship between days_since_2011 and the predicted bike rentals.

Temperature shows an inverted U-shaped relationship between temp and the predicted bike rentals, with higher rentals at moderate temperatures (around 20-25 degrees Celsius). This suggests that the relationship between temp and the predicted bike rentals is not linear, but rather has a more complex shape.

The Humidity PDP shows a slightly negative relationship between hum and the predicted bike rentals, with lower rentals at higher humidity levels. This suggests that high humidity may be a deterrent for people to rent bikes.

The Win Speed PDP graph shows a roughly linear negative relationship between windspeed and the predicted bike rentals, with lower rentals at higher wind speeds. This suggests that high winds may make it less desirable to rent bikes.

In summary, the PDPs suggest that days_since_2011 has a positive influence on the predicted bike rentals, while temp has a U-shaped influence, hum has a slightly negative influence, and windspeed has a roughly linear negative influence. However, it's important to note that PDPs only show the marginal influence of a single variable on the outcome, while holding all other variables constant at their average values. The true relationships between the variables and bike rentals may be more complex and may involve interactions between variables.


