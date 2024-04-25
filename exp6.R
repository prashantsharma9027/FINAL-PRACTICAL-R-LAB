# Load necessary libraries
library(ggplot2)

# Simulate Bernoulli distribution
bernoulli_data <- rbinom(n = 1500, size = 5, prob = 0.7)

# Simulate Binomial distribution
binomial_data <- rbinom(n = 1500, size = 10, prob = 0.3)

# Simulate Poisson distribution
poisson_data <- rpois(n = 1500, lambda = 3)

# Plot probability mass functions (PMFs)
ggplot(data.frame(x = bernoulli_data), aes(x = x)) +
  geom_bar(stat = "count", width = 0.7) +
  labs(title = "Bernoulli Distribution", x = "Outcome (Success/Failure)", y = "Frequency")

ggplot(data.frame(x = binomial_data), aes(x = x)) +
  geom_bar(stat = "count", width = 0.3) +
  labs(title = "Binomial Distribution", x = "Number of Successes", y = "Frequency")

ggplot(data.frame(x = poisson_data), aes(x = x)) +
  geom_bar(stat = "count", width = 0.9) +
  labs(title = "Poisson Distribution", x = "Number of Events", y = "Frequency")