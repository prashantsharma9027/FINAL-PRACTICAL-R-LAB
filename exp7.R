# Load necessary libraries
library(ggplot2)

# Simulate Uniform distribution
uniform_data <- data.frame(distribution = "Uniform", value = runif(1000, min = 0, max = 5))

# Simulate Exponential distribution
exponential_data <- data.frame(distribution = "Exponential", value = rexp(1000, rate = 0.5))

# Simulate Normal distribution
normal_data <- data.frame(distribution = "Normal", value = rnorm(1000, mean = 35, sd = 13))

# Combine data
combined_data <- rbind(uniform_data, exponential_data, normal_data)

# Plot density plots
ggplot(combined_data, aes(x = value, fill = distribution)) +
  geom_density(alpha = 0.5) +
  facet_wrap(~ distribution, ncol = 1) +
  labs(title = "Distribution Comparison", x = "Value", y = "Density")
