# Load required libraries
library(ggplot2)
library(caret)

# Sample Dataset
product_data <- data.frame(
  Product_ID = c(101, 102, 103, 104, 105, 106, 107, 108, 109),
  Category = c("Electronics", "Clothing", "Electronics", "Home", "Beauty", "Electronics", "Home", "Beauty", "Clothing"),
  Price = c(5090, 3040, 6000, 1000, 7825, 1500, 4500, 6060, 3050),
  Stock = c(100, 200, 150, 70, 100, 190, 70, 400, 180)
)

# Perform simple linear regression
linear_model <- lm(Price ~ Stock, data = product_data)

# Perform multiple regression (using Category as a factor variable)
multiple_model <- lm(Price ~ Stock + Category, data = product_data)

# Perform polynomial regression
poly_model <- lm(Price ~ poly(Stock, degree = 2), data = product_data)

# Evaluate model performance
linear_summary <- summary(linear_model)
multiple_summary <- summary(multiple_model)
poly_summary <- summary(poly_model)

# Additional Model Evaluation Metrics
linear_mse <- mean(residuals(linear_model)^2)
multiple_mse <- mean(residuals(multiple_model)^2)
poly_mse <- mean(residuals(poly_model)^2)

# Cross-validation for model comparison
cv_linear <- train(Price ~ Stock, data = product_data, method = "lm", trControl = trainControl(method = "cv"))
cv_multiple <- train(Price ~ Stock + Category, data = product_data, method = "lm", trControl = trainControl(method = "cv"))
cv_poly <- train(Price ~ poly(Stock, degree = 2), data = product_data, method = "lm", trControl = trainControl(method = "cv"))
# Visualization of regression results
ggplot(product_data, aes(x = Stock, y = Price)) +
  geom_point() +
  geom_smooth(data = product_data, method = "lm", se = FALSE, color = "blue", aes(group = 1)) +
  labs(title = "Linear Regression Analysis", x = "Stock", y = "Price")

# Visualization for Multiple Regression
ggplot(product_data, aes(x = Stock, y = Price, color = Category)) +
  geom_point() +
  geom_smooth(data = product_data, method = "lm", se = FALSE, aes(group = 1)) +
  labs(title = "Multiple Regression Analysis", x = "Stock", y = "Price")

# Visualization for Polynomial Regression
ggplot(product_data, aes(x = Stock, y = Price)) +
  geom_point() +
  geom_smooth(data = product_data, method = "lm", formula = y ~ poly(x, 2), se = FALSE, color = "red", aes(group = 1)) +
  labs(title = "Polynomial Regression Analysis", x = "Stock", y = "Price")
# Diagnostic Plots for Linear Regression
linear_diagnostic_plots <- ggplot(product_data, aes(x = fitted(linear_model), y = residuals(linear_model))) +
  geom_point() +
  geom_smooth(se = FALSE, color = "blue") +
  labs(title = "Linear Regression Diagnostic Plot", x = "Fitted Values", y = "Residuals")

# Diagnostic Plots for Multiple Regression
multiple_diagnostic_plots <- ggplot(product_data, aes(x = fitted(multiple_model), y = residuals(multiple_model))) +
  geom_point() +
  geom_smooth(se = FALSE, color = "green") +
  labs(title = "Multiple Regression Diagnostic Plot", x = "Fitted Values", y = "Residuals")

# Diagnostic Plots for Polynomial Regression
poly_diagnostic_plots <- ggplot(product_data, aes(x = fitted(poly_model), y = residuals(poly_model))) +
  geom_point() +
  geom_smooth(se = FALSE, color = "red") +
  labs(title = "Polynomial Regression Diagnostic Plot", x = "Fitted Values", y = "Residuals")

# Display Diagnostic Plots
print(linear_diagnostic_plots)
print(multiple_diagnostic_plots)
print(poly_diagnostic_plots)

# Create diagnostic plots for each regression model (residuals vs. fitted values, QQ plots, etc.)

# Print Results
cat("Linear Regression Coefficients:\n")
print(coefficients(linear_model))

cat("\nLinear Regression R-squared:\n", linear_summary$r.squared, "\n")
cat("Linear MSE:", linear_mse, "\n")

cat("\nMultiple Regression Coefficients:\n")
print(coefficients(multiple_model))

cat("\nMultiple Regression R-squared:\n", multiple_summary$r.squared, "\n")
cat("Multiple MSE:", multiple_mse, "\n")

cat("\nPolynomial Regression Coefficients:\n")
print(coefficients(poly_model))

cat("\nPolynomial Regression R-squared:\n", poly_summary$r.squared, "\n")
cat("Polynomial MSE:", poly_mse, "\n")

# Cross-validation Results
print(cv_linear)
print(cv_multiple)
print(cv_poly)
